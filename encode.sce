// La fonction encode, permet de cacher le message dans l'image.
// La technique consiste à décomposer le message en binaire et analyser les pixel de l'image au
// fur et à mesure. Si le bit a écrire est égale a 0, on analyse la valeur de l'octect courant de l'image, si le code ASCII est pair, cela veut dire que le dernier bit == 0
// donc pas besoin de modifier la valeur, mais si si la valeur de l'octet est impaire, cela veut dire que le dernier bit == 1 donc on incrémente la valeur de l'octet de 1
// afin qu'on retrouve une valeur pair ... idem si le bit à écrire == 1 ...

function res=encode(original_pics,text)
    res = original_pics;
    [h,w] = size(original_pics); 
    ascii_text = ascii(text); // convertir le texte en une matrice de code ASCII
    len_code = length(text); // récupérer la taille du texte
    binary_code = decToBin(len_code); //convertir la taille du texte en binaire
    
    //Si le message secret contient plus de 256 caractères
    if((len_code) > 256) then
        disp("Le message est trop long, veuillez ne pas dépasser 256 caractères.");
        return;
    end
    //Si l'image est trop petite pour acceuillir le message
    if((len_code+1)*8 > h*w) then
        disp("L image n est pas assez grande pour contenir ce message, veuillez choisir une plus grande image");
        return;
    end
    
    acc = 0;

    current_character = 0;
    current_bit = 1;
    for i=1:h
        for j=1:w
            rgb = 1;
            while(rgb <= 3)
                byte = original_pics(i,j,rgb); // on récupère la valeur du pixel courant
                bit = binary_code(current_bit); // on récupère le bit à inclure 
                
                if(bit == '0') then // si le bit à ecrire == 0
                    acc = acc + 1;
                    if(modulo(uint8(byte),uint8(2)) == 1) then // si la valeur du pixel est impair on rajoute 1 afin que la valeure de l'octet devienne paire
                        res(i,j,rgb) = byte + 1;
                    end
                end 
                if(bit == '1') then // si le bit a ecrire == 1
                    acc = acc + 1;
                    if(modulo(uint8(byte),uint8(2)) == 0) then // si la valeur du pixel est pair on rajoute 1 afin que la valeure de l'octet devienne impair
                        res(i,j,rgb) = byte + 1;
                    end
                end

                rgb = rgb+1;
                current_bit = current_bit+1;
                if(current_bit > 8) then // si on a écrit 8 bit, on doit passer à l'octet suivant
                    if(current_character < len_code) then // incrémentation du carractère courant
                        current_character = current_character + 1; 
                    else // si on a dépasser la taille du code, alors il n'y a plus rien a écrire, et donc on sort de la fonction.
                        return;
                    end
                    binary_code = emptystr();
                    binary_code = decToBin(ascii_text(current_character)); // convertir la lettre suivante en binaire
                    current_bit = 1; 
                end 
            end
        end
    end
endfunction
