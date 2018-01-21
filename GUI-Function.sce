// Ce fichier contient les fonctions qui seront associée au objet graphique 

//Cette fonction sert à ouvrir une image.
// Elle renvoie en sortie le tableaux de données de l'image ainsi qu'une 
// valeur de vérification pour savoir si le chargement s'est bien passé
function [res,verif]=openPicture()
    path = null;
    path = uigetfile("","", "Choose a picture");
    if(path ~= null) then
        res = imread(path);
        verif = 1;
    end
    
    pathPicsText=uicontrol(h,"style","text");
    pathPicsText.Position = [215 296 500 40];
    pathPicsText.BackgroundColor = [0.8,0.8,0.8];
    pathPicsText.FontSize = 11;
    pathPicsText.String = path;
endfunction

// Cette fonction définit un dossier de sauvegarde pour l'image de sortie
// elle renvoie en sortie le chemin du dossier sous forme de chaine de caractères
function path = saveDirectory()
    path = uigetdir("", "Choose a directory");
    pathDirText=uicontrol(h,"style","text");
    pathDirText.Position = [215 244 500 40];
    pathDirText.String = path;
    pathDirText.BackgroundColor = [0.8,0.8,0.8];
    pathDirText.FontSize = 11;
    
endfunction

//Cette fonction teste si les champs nécéssaire au programme on bien été renseigné :
// - Le chemin de l'image, - Le chemin du dossier de sauvegarde, - le message secret
// Si l'un des champs n'est pas renseigné, une messagebox s'affiche pour en informer l'utilisateur
function res=testError(mod)
   if (verif == 0) then //pics == null then
        [btn] = messagebox("You have to load a picture !", "ERROR", "error");
        res = 1; return;
    end
    if(mod == 0) then
        if((dirPath == null)) then
            [btn] = messagebox("You have to enter a backup location!", "ERROR", "error");
            res = 1; return;
        end
        if((length(text) == 0)) then
            [btn] = messagebox("You have to write a secret message !", "ERROR", "error");
            res = 1; return;
        end
    end
    res = 0;
endfunction

// Cette fonction sert à sauvegarder l'image encodée dans le dossier de sauvegarde sous le nom et
// le format définit par l'utilisateur
function savePicture(pics)
    fileName = fullfile(dirPath,string(outPicsName)+string(outPicsFormat));
    imwrite(pics,fileName);
endfunction

// Cette fonction est associée au bouton Start
// Elle sert a lancer le programme en fonction du mode choisit : encodage ou décodage 
function start()
    if(encodeCheckBox.Value == 1) then
        text = secretEditText.string;
        outPicsFormat = formatEditText.string;
        outPicsName = outputEditText.string;
        if(testError(0) == 1) then // si une erreur est détéctée, on quitte la fonction
            return;
        end
        pics = prepare_data(pics);
        pics = encode(pics,text);
        savePicture(pics);
        [btn] = messagebox("Encoding Success !!!", "Success", "scilab");
    end

    if(decodeCheckBox.Value == 1) then
        if(testError(1) == 1) then // si une erreur est détéctée, on quitte la fonction
            return;
        end
        t = decode(pics);
        disp("Le message secret est : " + t);
        [btn] = messagebox(["Decoding Success !!!" "The message is on the console"], "Success", "scilab");
    end

endfunction
