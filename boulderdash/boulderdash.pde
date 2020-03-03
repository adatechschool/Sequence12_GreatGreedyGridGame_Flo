int taille_tableau = 15;
int posx = 0;
int posy = 0;
int taille_cellule = 600/taille_tableau;
Player P1 = new Player(0, 0);
Boulder B1 = new Boulder(5, 5);
Boulder B2 = new Boulder(3, 11);
Diamond D1 = new Diamond(10, 10);
int flag = 0;
int Xporte = int(random(15));
int Yporte = int(random(15));
int Gporte = - 1;
//int k = 7;
//Boulder[] tabBoulders = new Boulder[k];
//for (int i = 0; i < k; i++)
//{
//  tabBoulders[k]  = new Boulder(int(random(15)), int(random(15)));
//}

void setup()
{
   size(800, 600);
   background(210, 125, 105);
}

void draw()
{
   int taille_cellule = height/taille_tableau;
   int pos_perso = 0;
   fill(210, 125, 105);
   rect(600, 0, 200, 800);
   
   for (int i = 0; i < taille_tableau; i++)
   {
     for (int j = 0; j < taille_tableau; j++)
     {
       fill(255);
       rect(i*taille_cellule, j*taille_cellule, taille_cellule, taille_cellule);
     }
   }
   B1.dessiner();
   B2.dessiner();
   D1.dessiner();
   if (keyPressed && flag == 0)
   {
     flag = 1;
     P1.bouger();
   }
   P1.dessiner();
   if (frameCount%4 == 0)
   {
     B1.bouger();
     B2.bouger();
   }
   pos_perso = P1.get_pos();
   
   if (B1.get_pos() == pos_perso)
   {
     explosion();
   }
   
   if (B2.get_pos() == pos_perso)
   {
     explosion();
   }
   if (D1.get_pos() == pos_perso)
   {
     D1.Xpos = int(random(15));
     D1.Ypos = int(random(15));
     D1.dessiner();
     P1.augmente_score();
   }
   affiche_score();
   if (P1.get_score() >= 10)
   {
     apparition_porte();
     if (P1.get_pos() == apparition_porte())
     {
       print(P1.get_pos());
       print(apparition_porte());
       victoire();
     }
   }
}

void victoire()
{
  textSize(155);
  fill(0, 255, 0);
  text("VICTIORE", 50, 200);
}

int apparition_porte()
{
  fill(25, 250, 150);
  rect(Xporte*taille_cellule, Yporte*taille_cellule, taille_cellule, taille_cellule);
  Gporte = Xporte + Yporte*100;
  return Gporte;
}

void affiche_score()
{
  String score = "Score = " + str(P1.get_score());
  textSize(30);
  fill(50, 50, 50);
  text(score , 620, 50);
}

void explosion()
{
    textSize(58);
    fill(255, 0, 0);
    text("EXPLOSION FATALE", 200, 200);
    P1.score = 0;
}

void keyReleased()
{
  flag = 0;
}
