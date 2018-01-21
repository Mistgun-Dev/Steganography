// Ce fichier contient la fonction de décodage du programme
// Elle parcoure l'image tout en reconstituant les octets du message dissimulé bit par bit
// Afin de récupérer le bit caché dans l'octet, il suffit d'analyser la valeur de l'octet.
// Si la valeur est paire, alors le bit caché est 0 sinon le bit caché est 1
// La fonction renvoie en sortie le message décodé sous forme de chaine de caractères
function res=decode(encoded_pics)
    [h,w] = size(encoded_pics);
    binary_byte = emptystr();
    len_text = 0;
    text = 0;
    search_size = 1;
    current_character = 1;
    current_bit = 1;
    
    for i=1:h
        for j=1:w
            rgb = 1;
            while(rgb <= 3)
                byte = encoded_pics(i,j,rgb);
                if(modulo(uint8(byte),uint8(2)) == 0) then
                    binary_byte = '0'+ binary_byte;
                else
                   binary_byte = '1' + binary_byte;
                end
                rgb = rgb+1;
                current_bit = current_bit+1;

                if(current_bit > 8) then
                    if(search_size == 1) then
                        len_text = bin2dec(binary_byte);
                        search_size = 0;
                    else
                        text($+1) = bin2dec(binary_byte);
                        current_character = current_character + 1;
                    end
                    binary_byte = emptystr();
                    current_bit = 1; 
                end
                if(current_character > len_text & search_size == 0) then   
                    text = ascii(text); 
                    text = string(text);
                    res = text;
                    return; 
                end
            end 
        end
    end
endfunction
