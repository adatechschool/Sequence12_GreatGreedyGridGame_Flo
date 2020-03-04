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
    image(herbe, posx*taille_cellule, posy*taille_cellule, taille_cellule, taille_cellule);
  }
  
  void dessiner()
  {
   image(bill, Xpos*taille_cellule, Ypos*taille_cellule, taille_cellule, taille_cellule);
  }
  
  void bouger()
  {  
    int prev_Xpos = this.Xpos;
    int prev_Ypos = this.Ypos;
    if (key == 'z' && Ypos > 0)
      {
        Ypos--;
        if (!check_case(this.get_pos()))
        {
         Xpos = prev_Xpos;
         Ypos = prev_Ypos;
        }
        return;
      }
      if (key == 's' && Ypos < taille_tableau - 1)
      {
        Ypos++;
        if (!check_case(this.get_pos()))
        {
         Xpos = prev_Xpos;
         Ypos = prev_Ypos;
        }
        return;
      }
      if (key == 'q' && Xpos > 0)
      {
        Xpos--;
        if (!check_case(this.get_pos()))
        {
         Xpos = prev_Xpos;
         Ypos = prev_Ypos;
        }
        return;
      }
      if (key == 'd' && Xpos < taille_tableau - 1)
      {
        Xpos++;
        if (!check_case(this.get_pos()))
        {
         Xpos = prev_Xpos;
         Ypos = prev_Ypos;
        }
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
    image(herbe, Xpos*taille_cellule, Ypos*taille_cellule, taille_cellule, taille_cellule);
  }
  
  void dessiner()
  {
    fill(int(random(120)), 150, 215);
    rect(Xpos*taille_cellule, Ypos*taille_cellule, taille_cellule, taille_cellule);
  }
  
  void bouger()
  {
      int direction = int(random(4) + 1);
      int prev_Xpos = this.Xpos;
      int prev_Ypos = this.Ypos;
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
      print(check_case(this.get_pos()));
      if (!check_case(this.get_pos()))
      {
         Xpos = prev_Xpos;
         Ypos = prev_Ypos;
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

class Mechant
{
  int Xpos, Ypos, Gpos;
  Mechant (int a, int b)
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
    image(vaisseau, Xpos*taille_cellule, Ypos*taille_cellule, taille_cellule, taille_cellule);
  }
  
  void bouger(int targetX, int targetY)
  {
      int diffX = targetX - this.Xpos;
      int diffY = targetY - this.Ypos;
      if (abs(diffX) > abs(diffY))
      {
        if (this.Xpos > targetX)
        {
          Xpos--;
        }
        else if (this.Xpos < targetX)
        {
          Xpos++;
        }
      }
      else
      {
        if (this.Ypos > targetY)
        {
          Ypos--;
        }
        else if (this.Ypos < targetY)
        {
          Ypos++;
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
