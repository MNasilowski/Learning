      program AnalizaWach
      implicit none
      Real Tab216 (216), Tab (54), Histogram1(30), Histogram2(90)
      Real Histogram3(30), Histogram4(30),z, Tab4(54,2),Tab8(27,2)
      DoublePrecision Tab18(12,2), Tab9(24,2)
      DoublePrecision ksi4,ksi8,ksi9,ksi18,sred216,s4,s8,s9,s18
      integer i,j
c     Nadawanie wartosci poczatkowych
      ksi4 = 0
      ksi8 = 0
      ksi9 = 0
      ksi18 = 0
      s4 = 0
      s8 = 0
      s9 = 0
      s18 = 0
      sred216 = 0
      Do 108 i=1,30
      Histogram1(i) = 0
      Histogram3(i) = 0
      Histogram4(i) = 0
108   Continue
      Do 111 i=1,90
      Histogram2(i) = 0
111   Continue
      Do 225 i = 1,54
         Tab4(i,1) = 0
         Tab4(i,2) = 0
225   continue
      do 226 i =1,27
         Tab8(i,1) = 0
         Tab8(i,2) = 0
226   continue
      do 227 i = 1,12
         Tab18(i,1) = 0
         Tab18(i,2) = 0
227   continue
      do 228 i = 1,24
         Tab9(i,1) = 0
         Tab9(i,2) = 0
228   continue
c     wczytywanie 216 okresow
      Open(UNIT = 10,FILE = 't216.txt',ERR = 101)
				
		Do 103 i=1,216
		read(10,*,END = 105), Tab216(i)
103		Continue
      
       Close (UNIT = 10)
c     Wczytywanie 54 zliczen
       Open(UNIT = 10,FILE = 'T4time54.txt',ERR = 101)
				
		Do 104 i=1,54
		read(10,*,END = 105), Tab(i)
104             Continue
       Close (10)
c     **********Rysowanie Histogramu a ***************
       Do 106 i=1,216
       Do 107 j=1,30
        if ((Tab216(i).GT.(3 + (j-1)*0.03))) then
        if ((Tab216(i)).LE.(3 + j*0.03)) then
             Histogram1(j) = Histogram1(j) + 1;
       end if
       end if
107    continue 
106    continue

c     **********Rysowanie Histogramu dodatkowy ***************
       Do 110 i=1,216
       Do 112 j=1,90
        if ((Tab216(i).GT.(3 + (j-1)*0.01))) then
        if ((Tab216(i)).LE.(3 + j*0.01)) then
             Histogram2(j) = Histogram2(j) + 1;
       end if
       end if
 112   continue 
 110  continue
c     **********Rysowanie Histogramu c ***************
       Do 114 i=1,216
       Do 113 j=1,30
        if (((Tab(i)/4).GT.(3 + (j-1)*0.03))) then
        if (((Tab(i))/4).LE.(3 + j*0.03)) then
             Histogram3(j) = Histogram3(j) + 1;
       end if
       end if
 113   continue 
 114   continue
c     **********Rysowanie Histogramu b ***************
       Do 115 i=1,216,4
       Do 116 j=1,30
          z  = Tab216(i) + Tab216(i+1) +Tab216(i+2) +Tab216(i +3)
        if ((z/4).GT.(3 + (j-1)*0.03)) then
        if ((z/4).LE.(3 + j*0.03)) then
             Histogram4(j) = Histogram4(j) + 1;
       end if
       end if
 116  continue 
 115  continue
c     *******************ZAD3************************
c     *******************54 * 4 *********************
c     *************Liczenie srednich*****************
      do 220 i = 1,54
         do 221 j = 0,3
            Tab4(i,1) = Tab4(i,1) +Tab216(i*4-j)
221      Continue
         Tab4(i,1) = Tab4(i,1)/4
220   continue
c     ************Liczenie Ksi***********************
      do 230 i = 1,54
         do 231 j = 0,3
            Tab4(i,2) = (Tab216(i*4-j) - tab4(i,1))**2 + Tab4(i,2)
231      Continue
         ksi4 = ksi4 +Tab4(i,2)
230   continue
         ksi4 = ksi4/54
         print*,ksi4
c     *******************27 * 8 *********************
c     *************Liczenie srednich*****************
      do 240 i = 1,27
         do 241 j = 0,7
            Tab8(i,1) = Tab8(i,1) +Tab216(i*8-j)
241      Continue
         Tab8(i,1) = Tab8(i,1)
240   continue
c     ************Liczenie Ksi***********************
      do 242 i = 1,27
         do 243 j = 0,7
            Tab8(i,2) = ((Tab216(i*8-j) - tab8(i,1))**2)+Tab8(i,2)
 243     Continue
         ksi8 = ksi8 +Tab8(i,2)
 242  continue
         ksi8 = ksi8/27
         print*,ksi8
c     *******************24 * 9 *********************
c     *************Liczenie srednich*****************
      do 250 i = 1,24
         do 251 j = 0,8
            Tab9(i,1) = Tab9(i,1) +Tab216(i*9-j)
251      Continue
         Tab9(i,1) = Tab9(i,1)
250   continue
c     ************Liczenie Ksi***********************
      do 252 i = 1,24
         do 253 j = 0,8
            Tab9(i,2) = (Tab216(i*9-j) - tab9(i,1))**2 + Tab9(i,2)
 253     Continue
         ksi9 = ksi9 +Tab9(i,2)
 252  continue
         ksi9 = ksi9/24
         print*,ksi9      
c     ******************12 * 18 *********************
c     *************Liczenie srednich*****************
      do 260 i = 1,12
         do 261 j = 0,17
            Tab18(i,1) = Tab18(i,1) + Tab216(i*18-j)
261      Continue
         Tab18(i,1) = Tab18(i,1)/18
260   continue
      print*,tab18
c     ************Liczenie Ksi***********************
      do 262 i = 1,12
         do 263 j = 0,17
            Tab18(i,2) = (Tab216(i*18-j) - tab18(i,1))**2 + Tab18(i,2)
 263     Continue
         ksi18 = ksi18 +Tab18(i,2)
 262  continue
         ksi18 = ksi18/12
         print*,ksi18
c     **********Liczenie sredniej 216****************
         do 271 i=1,216
            sred216 = sred216 + Tab216(i)
 271        continue
            sred216 = sred216/216
            print*,('srednia'),sred216
c     *********Liczenie s^2 dla 54******************
            do 281 i = 1,54
               s4 = s4 + (tab4(i,1) - sred216)**2
 281           continue
               s4 = s4/53
               print*,s4
c     *********Liczenie s^2 dla 27******************
            do 291 i = 1,27
               s8 = s8 + (tab8(i,1) - sred216)**2
 291           continue
               s8 = s8/26
               print*,s8
c     *********Liczenie s^2 dla 24******************
            do 292 i = 1,24
               s9 = s9 + (tab9(i,1) - sred216)**2
 292        continue
               s9 = s9/23
               print*,s9
c     *********Liczenie s^2 dla 12******************
            do 301 i = 1,12
               s18 = s18 + (tab18(i,1) - sred216)**2
 301           continue
               s18 = s18/11
               print*,s18
               
               
c     **********Zapisywanie wynikow******************
       Open(UNIT = 10,FILE = 'Wynikitxt',ERR = 101)
        write(10,*),('histogram co 0,03 dla 216')
	write(10,*),Histogram1	
        write(10,*),('histogram co 0,01 dla 216')
        write(10,*),Histogram2
        write(10,*),('histogram co 0,03 dla 54')
        write(10,*),Histogram3
        write(10,*),('Histogram co 0,03 dla 1/4 216')
        write(10,*),Histogram4
        write(10,*),('***********Zadanie3***********')
        write(10,*),('ksi sred dla przedz co 4'),ksi4
        write(10,*),('ksi sred dla przedz co 8'),ksi8
        write(10,*),('ksi sred dla przedz co 9'),ksi9
        write(10,*),('ksi sred dla przedz co 18'),ksi18
        write(10,*),('ksi s^2 dla przedz co 4'),s4
        write(10,*),('ksi s^2 dla przedz co 8'),s8
        write(10,*),('ksi s^2 dla przedz co 9'),s9
        write(10,*),('ksi s^2 dla przedz co 18'),s18
c        write(10,'(F6.4)'),Tab4
        Close (10)
c     ***********KONIEC****************************
105    Continue
101    Continue


       


       End
