
h = createWindow(); // Fenêtre principale du programme
h.Position = [0 0 520 450];
h.resize = "off";
h.figure_name = "Steganography Project";
funcprot(0);


//Titre du programme
titleText=uicontrol(h,"style","text");
titleText.Position = [70 420 400 30];
titleText.String = "------- Steganography -------";
titleText.FontWeight = "bold";
titleText.BackgroundColor = [0.8,0.8,0.8];
titleText.ForegroundColor = [1.0,0,0];
titleText.FontSize =25;

//CheckBox encode
encodeCheckBox = uicontrol(h,"style","checkbox");
encodeCheckBox.Position = [170 360 65 20];
encodeCheckBox.BackgroundColor = [0.9,0.9,0.9];
encodeCheckBox.String = "Encode";
encodeCheckBox.Value = 1;
encodeCheckBox.FontSize = 11;
encodeCheckBox.Groupname = "checkOption";
encodeCheckBox.Callback = "set(ButtonPics,""enable"",""on"");"+... // Si le mode "encode" est coché, on active tout les champs nécéssaire à ce mode
                          "set(ButtonDir,""enable"",""on"");"+...
                          "set(formatLabel,""enable"",""on"");"+...
                          "outputEditText.string = ""encoded-Pics"" ;"+...
                          "formatEditText.string = "".png"" ;"+...
                          "set(outputLabel,""enable"",""on"");"+...
                          "set(labelText,""enable"",""on"")";

//CheckBox decode
decodeCheckBox = uicontrol(h,"style","checkbox"); 
decodeCheckBox.Position = [300 360 65 20];
decodeCheckBox.BackgroundColor = [0.9,0.9,0.9];
decodeCheckBox.String = "Decode";
decodeCheckBox.FontSize = 11;
decodeCheckBox.Value = 0;
decodeCheckBox.Groupname = "checkOption";
decodeCheckBox.Callback = "set(ButtonDir,""enable"",""off"");"+... // Si le mode "decode" est coché, on désactive tout les champs non nécéssaire à ce mode
                          "set(formatLabel,""enable"",""off"");"+...
                          "set(outputLabel,""enable"",""off"");"+...
                          "secretEditText.string = """" ;"+...
                          "outputEditText.string = """" ;"+...
                          "formatEditText.string = """" ;"+...
                          "set(labelText,""enable"",""off"");";
 
//Bouton de chargement de l'image
ButtonPics=uicontrol(h,"style","pushbutton");
ButtonPics.Position = [80 300 110 30];
ButtonPics.String = "Load Picture";
ButtonPics.BackgroundColor=[0.9 0.9 0.9];
ButtonPics.Relief = "raised";
ButtonPics.Callback = "[pics,verif] = openPicture()";

//Bouton de chargement du dossier de sauvegarde
ButtonDir=uicontrol(h,"style","pushbutton");
ButtonDir.Position = [80 250 110 30];
ButtonDir.String = "Save Directory";
ButtonDir.BackgroundColor=[0.9 0.9 0.9];
ButtonDir.Relief = "raised";
ButtonDir.Callback = "dirPath = saveDirectory();";

//Boutton et barre d'edit pour écrire le message à cacher
labelText=uicontrol(h,"style","pushbutton");
labelText.Position = [80 100 110 30];
labelText.String = "Secret Message";
labelText.BackgroundColor = [0.9,0.9,0.9];
labelText.FontSize = 11;

secretEditText=uicontrol(h,"style","edit"); 
secretEditText.Position = [215 105 250 20]; 
secretEditText.String = ""; 
secretEditText.BackgroundColor=[1 1 1]; 

//Boutton et barre d'edit pour le nom du fichier de sortie
outputLabel=uicontrol(h,"style","pushbutton");
outputLabel.Position = [80 200 110 30];
outputLabel.String = "Output Name";
outputLabel.BackgroundColor=[0.9 0.9 0.9];

outputEditText=uicontrol(h,"style","edit"); 
outputEditText.Position = [215 205 250 20]; 
outputEditText.String = "encoded-Pics"; 
outputEditText.BackgroundColor=[1 1 1];     

//Boutton et barre d'edit pour le format de l'image 
formatLabel=uicontrol(h,"style","pushbutton");
formatLabel.Position = [80 150 110 30];
formatLabel.String = "Output Format";
formatLabel.BackgroundColor=[0.9 0.9 0.9];

formatEditText=uicontrol(h,"style","edit");
formatEditText.Position = [215 155 250 20]; 
formatEditText.String = ".png"; 
formatEditText.BackgroundColor=[1 1 1]; 

//Boutton de lancement du programme 
ButtonStart=uicontrol(h,"style","pushbutton");
ButtonStart.Position = [150 25 110 30];
ButtonStart.String = "Start";
ButtonStart.BackgroundColor=[0.9 0.9 0.9];
ButtonStart.Relief = "raised";
ButtonStart.Callback = "start();";
                       
//Boutton quitter
ButtonClose=uicontrol(h,"style","pushbutton");
ButtonClose.Position = [300 25 110 30];
ButtonClose.String = "Exit";
ButtonClose.BackgroundColor=[0.9 0.9 0.9];
ButtonClose.Relief = "raised";
ButtonClose.Callback = "close(h)";

