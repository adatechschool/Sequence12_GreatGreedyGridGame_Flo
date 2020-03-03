class Player
{
  int Xpos, Ypos, Gpos, score;
  Player (int a, int b)
  {
    Xpos = a;
    Ypos = b;
    Gpos = 100*b + a;
    score = 0;
  }
  
  int augmente_score()
  {
    score++;
    return score;
  }
  
  int get_score()
  {
    return score;
  }
  
  void clear()
  {
    fill(255);
    rect(posx*taille_cellule, posy*taille_cellule, taille_cellule, taille_cellule);
  }
  
  void dessiner()
  {
   //le carré noir
   fill(0);
   rect(Xpos*taille_cellule, Ypos*taille_cellule, taille_cellule, taille_cellule);
   // le rond rouge
   fill(constrain(int(millis()%250), 0, 255), millis()%100, random(25));
   ellipseMode(CENTER);
   ellipse(taille_cellule/2 + (Xpos*taille_cellule), taille_cellule/2 + (Ypos*taille_cellule), taille_cellule, taille_cellule);
   //le rond Central
   blendMode(BLEND);
   fill(constrain(int(millis()%600), 0, 125), constrain(millis()*120, 0, 255), random(100));
   ellipse(taille_cellule/2 + (Xpos*taille_cellule), taille_cellule/2 + (Ypos*taille_cellule), taille_cellule/2, taille_cellule/2);
  }
  
  void bouger()
  {  
    if (key == 'z' && Ypos > 0)
      {
        Ypos--;
        return;
      }
      if (key == 's' && Ypos < taille_tableau - 1)
      {
        Ypos++; 
        return;
      }
      if (key == 'q' && Xpos > 0)
      {
        Xpos--;
        return;
      }
      if (key == 'd' && Xpos < taille_tableau - 1)
      {
        Xpos++;
        return;
      }
  }
  int get_pos()
  {
    Gpos = 100*Ypos + Xpos;
    return Gpos;
  }
}


class Boulder
{
  int Xpos, Ypos, Gpos;
  Boulder (int a, int b)
  {
    Xpos = a;
    Ypos = b;
    Gpos = 100*b + a;
  }
  
  void clear()
  {
    fill(255);
    rect(Xpos*taille_cellule, Ypos*taille_cellule, taille_cellule, taille_cellule);
  }
  
  void dessiner()
  {
    fill(int(random(120)), 150, 215);
    rect(Xpos*taille_cellule, Ypos*taille_cellule, taille_cellule, taille_cellule);
  }
  
  void bouger()
  {
      int direction = int(random(4) + 1);    
      this.clear();
      switch(direction)
      {
        case 1:
          if (Xpos < taille_tableau - 1)
          {
            Xpos++;
            break;
          }
        case 2:
          if (Ypos < taille_tableau - 1)
          {
            Ypos++;
            break;
          }
        case 3:
          if (Xpos > 0)
          {
            Xpos--;
            break;
          }
        case 4:
          if (Ypos > 0)
          {
            Ypos--;
            break;
          }
      }
      this.dessiner();
      this.get_pos();
  }
    int get_pos()
  {
    Gpos = 100*Ypos + Xpos;
    return Gpos;
  }
}


class Diamond
{
  int Xpos, Ypos, Gpos;
  Diamond(int a, int b)
  {
    Xpos = a;
    Ypos = b;
    Gpos = 100*b + a;
  }
  
  void dessiner()
  {
    this.clear();
    fill(45, 245, 55);
    triangle(Xpos*taille_cellule + taille_cellule/2, Ypos*taille_cellule, Xpos*taille_cellule, (Ypos + 1)*taille_cellule, (Xpos + 1)*taille_cellule, (Ypos + 1)*taille_cellule);
  }
  
  void clear()
  {
    fill(255);
    triangle(Xpos*taille_cellule + taille_cellule/2, Ypos*taille_cellule, Xpos*taille_cellule, (Ypos + 1)*taille_cellule, (Xpos + 1)*taille_cellule, (Ypos + 1)*taille_cellule);
  }
  
  int get_pos()
  {
    Gpos = 100*Ypos + Xpos;
    return Gpos;
  }
}
