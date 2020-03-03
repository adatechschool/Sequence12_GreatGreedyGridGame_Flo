int taille_tableau = 15;
int posx = 0;
int posy = 0;
int taille_cellule = 600/taille_tableau;
Boulder B1 = new Boulder(5, 5);
Boulder B2 = new Boulder(3, 11);

class Boulder
{
  int Xpos, Ypos, Gpos;
  Boulder (int a, int b)
  {
    Xpos = a;
    Ypos = b;
    Gpos = 100*b + a;
  }
  
  void dessiner()
  {
    fill(100);
    rect(Xpos*taille_cellule, Ypos*taille_cellule, taille_cellule, taille_cellule);
  }
  
  void tomber()
  {
    while (Ypos < 16)
    {
      if (frameCount%60 == 0)
      {
        fill(255);
        rect(Xpos*taille_cellule, Ypos*taille_cellule, taille_cellule, taille_cellule);
        Ypos++;
        fill(100);
        rect(Xpos*taille_cellule, Ypos*taille_cellule, taille_cellule, taille_cellule);
      }
    }
  }
  
  int get_pos()
  {
    return Gpos;
  }
  
}

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
   textSize(32);
   text(str(personnage(posx, posy, taille_cellule)), 600, 60);
   fill(0);
   
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
   pos_perso = personnage(posx, posy, taille_cellule);
   
   if (B1.get_pos() == pos_perso)
   {
     explosion();
   }
   
   if (B2.get_pos() == pos_perso)
   {
     explosion();
   }
}

void explosion()
{
    textSize(58);
    fill(255, 0, 0);
    text("EXPLOSION FATALE", 200, 200);
}

int personnage(int posx, int posy, int taille_cellule)
{
  int pos_perso = posx + posy*100;
  // le carré noir
   fill(0);
   rect(posx*taille_cellule, posy*taille_cellule, taille_cellule, taille_cellule);
   // le rond rouge
   fill(constrain(int(millis()%250), 0, 255), millis()%100, random(25));
   ellipseMode(CENTER);
   ellipse(taille_cellule/2 + (posx*taille_cellule), taille_cellule/2 + (posy*taille_cellule), taille_cellule, taille_cellule);
   //le rond Central
   blendMode(BLEND);
   fill(constrain(int(millis()%600), 0, 125), constrain(millis()*120, 0, 255), random(100));
   ellipse(taille_cellule/2 + (posx*taille_cellule), taille_cellule/2 + (posy*taille_cellule), taille_cellule/2, taille_cellule/2);
   return pos_perso;
}


void keyPressed()
{
  if (key == 'z' && posy > 0)
  {
    posy--;
    return;
  }
  if (key == 's' && posy < taille_tableau - 1)
  {
    posy++; 
    return;
  }
  if (key == 'q' && posx > 0)
  {
    posx--;
    return;
  }
  if (key == 'd' && posx < taille_tableau - 1)
  {
    posx++;
    return;
  }
}
