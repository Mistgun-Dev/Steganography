text = null; //variable qui recevra le message a écrire dans l'image
dirPath = null; // variable qui recevra le chemin de l'image
pics = null; // variable qui recevra les données de l'image
outPicsName = null; // variable qui recevra le nom de l'image à sauvegarder
outPicsFormat = null; // variable qui recevra le format de l'image à sauvegarder
verif = 0; // variable qui sert a vérifier que l'image a bien été chargée : 1 = bien chargé, 0 = problème ...


//Fonction qui remplace tous les octect 255 à 254 
function res=prepare_data(pics)
    res = pics;
    x = length(text);
    acc = 0;
    [h,w] = size(pics);
    for i=1:h
        for j=1:w
            if(pics(i,j,1) == 255) then res(i,j,1) = 254; end
            if(pics(i,j,2) == 255) then res(i,j,2) = 254; end
            if(pics(i,j,3) == 255) then res(i,j,3) = 254; end
            acc = acc + 3;
            if(acc >= x) // on s'arrête si on a dépasser le nombre de caractère du message
                return;
            end
        end
    end
    res=uint8(res);
endfunction

//Conversion d'un nombre décimal en binaire, renvoie une chaine de caractère
//Redéfinition de la fonction bin2dec() car celle-ci n'est pas approprié pour ce programme.
function res=decToBin(dec)
    tmp = dec2bin(dec);
    res=['0','0','0','0','0','0','0','0'];
    n = length(tmp);
    k = 1;
    i = n;
    while i >= 1
        res(i) = part(tmp,k);
        k = k+1;
        i = i-1;
    end
    res = string(res);
endfunction
