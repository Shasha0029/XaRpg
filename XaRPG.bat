@echo off
title Shadow's RPG
  setlocal=enabledelayedexpansion
:MainMenu
  cls
  echo Welcome to Shadow's RPG, this is a random text game he made because he got bored.
  echo/
  echo	1... Start new game.
  echo	2... Load game.
  echo	3... Credits.
  echo/
  choice.exe /C 123 /N /M :"Your choice: "
  if %errorlevel% equ 3 goto Option3
  if %errorlevel% equ 2 goto Option2
  if %errorlevel% equ 1 goto Option1

:Option1
  cls
  echo Start a new game?
  echo Y = Yes, N = No
  choice.exe /C YN /N /M :"Yes or No?: "
  if %errorlevel% equ 2 goto MainMenu
  echo What is your name, traveller?
  echo/
  Set /p name=
  echo/
    md %name%-XRPG
    set ir=%cd%
    md %name%-XRPG
      set dir=%ir%\%name%-XRPG\
      md %dir%Mobs
        set mdir=%ir%\%name%-XRPG\Mobs\
      md %dir%Player
        set pdir=%ir%\%name%-XRPG\Player\
      md %dir%Skills
        set sdir=%ir%\%name%-XRPG\Skills\
          md %sdir%AtkSkills
          md %sdir%BuffSkills
            set asdir=%ir%\%name%-XRPG\Skills\AtkSkills\
            set bsdir=%ir%\%name%-XRPG\Skills\BuffSkills\
  echo %name% is it? Pleasure to meet you.
  echo Let's move onwards to your stat selections.
  echo Here, you can distribute your stat points.
  echo You start with 5.
  echo 5 >>%dir%SP.txt
  pause
Goto Stats1

:Stats1
  cls
  echo Here are your current stats.
  echo/
  Echo Level 1
  Echo Health 10
  Echo Attack 1
  Echo Defense 0
  Echo Speed 1
  Echo Mana 0
  Echo 1 >>%dir%Lvl.txt
  Echo 1 >>%dir%Exp.txt
  Echo 10 >>%dir%Hp.txt
  Echo 10 >>%dir%MaxHp.txt
  Echo 1 >>%dir%Atk.txt
  Echo 0 >>%dir%Def.txt
  Echo 1 >>%dir%Spd.txt
  Echo 0 >>%dir%MaxMana.txt
  Echo 0 >>%dir%Mana.txt
  Echo 0 >>%dir%BattleID.txt
  echo/
  echo Pick the matching letter to increase them.
  echo You have 5 points remaining.
  choice.exe /C HADSM /N /M :"H, A, D, S, M.: "
  if %errorlevel% equ 5 goto Mana1
  if %errorlevel% equ 4 goto Speed1
  if %errorlevel% equ 3 goto Defence1
  if %errorlevel% equ 2 goto Attack1
  if %errorlevel% equ 1 goto Health1

:Health1
  set/p "val=" <%dir%SP.txt
  set/a "val-=1"
  (echo(%val%)>%dir%SP.txt
  set/p "val=" <%dir%Hp.txt
  set/a "val+=5"
  (echo(%val%)>%dir%MaxHp.txt
  set/p "val=" <%dir%MaxHp.txt
  set/a "val+=5"
  (echo(%val%)>%dir%MaxHp.txt
Goto Stats2

:Attack1
  set/p "val=" <%dir%SP.txt
  set/a "val-=1"
  (echo(%val%)>%dir%SP.txt
  set/p "val=" <%dir%Atk.txt
  set/a "val+=1"
  (echo(%val%)>%dir%Atk.txt
Goto Stats2

:Defence1
  set/p "val=" <%dir%SP.txt
  set/a "val-=1"
  (echo(%val%)>%dir%SP.txt
  set/p "val=" <%dir%Def.txt
  set/a "val+=1"
  (echo(%val%)>%dir%Def.txt
Goto Stats2

:Speed1
  set/p "val=" <%dir%SP.txt
  set/a "val-=1"
  (echo(%val%)>%dir%SP.txt
  set/p "val=" <%dir%Spd.txt
  set/a "val+=1"
  (echo(%val%)>%dir%Spd.txt
Goto Stats2

:Mana1
  set/p "val=" <%dir%SP.txt
  set/a "val-=1"
  (echo(%val%)>%dir%SP.txt
  set/p "val=" <%dir%Mana.txt
  set/a "val+=5"
  (echo(%val%)>%dir%Mana.txt
  (echo(%val%)>%dir%MaxMana.txt
Goto Stats2

:Stats2
  cls
  echo Here are your current stats.
  echo/
  for /f "tokens=* delims=," %%G in (%dir%lvl.txt) do @echo Level: %%G
  for /f "tokens=* delims=," %%G in (%dir%hp.txt) do @echo Health: %%G
  for /f "tokens=* delims=," %%G in (%dir%atk.txt) do @echo Attack: %%G
  for /f "tokens=* delims=," %%G in (%dir%def.txt) do @echo Defense: %%G
  for /f "tokens=* delims=," %%G in (%dir%spd.txt) do @echo Speed: %%G
  for /f "tokens=* delims=," %%G in (%dir%mana.txt) do @echo Mana: %%G
  echo/
  echo Pick the matching letter to increase them.
  for /f "tokens=* delims=," %%G in (%dir%sp.txt) do @echo You have %%G points remaining.
    for /f "tokens=* delims=," %%G in (%dir%sp.txt) do set number=%%G
    if %number% Equ 0 goto 1 else (
    choice.exe /C HADSM /N /M :"H, A, D, S, M.: "
    if %errorlevel% equ 5 goto Mana1
    if %errorlevel% equ 4 goto Speed1
    if %errorlevel% equ 3 goto Defence1
    if %errorlevel% equ 2 goto Attack1
    if %errorlevel% equ 1 goto Health1
  )

:Option2
  cls
  echo Load game
  echo/
  echo Enter save name.
  Set /p name=
  set dir=C:\Users\Xa\Desktop\%name%-XRPG\
  md %dir%Mobs
    set mdir=C:\Users\Xa\Desktop\%name%-XRPG\Mobs\
  md %dir%Player
    set pdir=C:\Users\Xa\Desktop\%name%-XRPG\Player\
  md %dir%Skills
    set sdir=C:\Users\Xa\Desktop\%name%-XRPG\Skills\
  md %sdir%AtkSkills
    set asdir=C:\Users\Xa\Desktop\%name%-XRPG\Skills\AtkSkills\
  md %sdir%BuffSkills
    set bsdir=C:\Users\Xa\Desktop\%name%-XRPG\Skills\BuffSkills\
  cls
    Echo %name%
    for /f "tokens=* delims=," %%G in (%dir%lvl.txt) do @echo Level: %%G
    for /f "tokens=* delims=," %%G in (%dir%hp.txt) do @echo Health: %%G
    for /f "tokens=* delims=," %%G in (%dir%atk.txt) do @echo Attack: %%G
    for /f "tokens=* delims=," %%G in (%dir%def.txt) do @echo Defense: %%G
    for /f "tokens=* delims=," %%G in (%dir%spd.txt) do @echo Speed: %%G
    for /f "tokens=* delims=," %%G in (%dir%mana.txt) do @echo Mana: %%G
    echo/
    echo Is this your save?
  choice.exe /C YN /N /M :"Yes or No?: "
  if %errorlevel% equ 2 goto MainMenu
for /f "tokens=* delims=," %%G in (%dir%Save.txt) do set Save=%%G
Goto %Save%

:Option3
  cls
    echo Credits
    echo Damn, why tf you even here mf
    echo Go play the damn game smh.
  pause
Goto MainMenu

:1
  del %dir%save.txt
  del %dir%BattleID.txt
  Echo 1 >>%dir%Save.txt
  Del %mdir%rathp.txt
  Del %mdir%ratatk.txt
  Del %mdir%ratdef.txt
  Del %mdir%ratspd.txt
  cls
    echo You awaken to find yourself in a dark room.
    echo As your eyes slowly start to adjust to the darkness,
    echo You begin to be able to see your surroundings.
    echo After your eyes finish adjusting you find a Rat
    echo Staring at you, baring it's fangs. Are you ready?
  Echo TutorialRat >> %dir%BattleID.txt
  Echo 5 >> %mdir%rathp.txt
  Echo 2 >> %mdir%ratatk.txt
  Echo 0 >> %mdir%ratdef.txt
  Echo 1 >> %mdir%ratspd.txt
  pause
  for /f "tokens=* delims=," %%G in (%dir%battleid.txt) do set bid=%%G
Goto TutorialRat

:TutorialRat
  for /f "tokens=* delims=," %%G in (%dir%hp.txt) do set hp=%%G
  for /f "tokens=* delims=," %%G in (%dir%atk.txt) do set atk=%%G
  for /f "tokens=* delims=," %%G in (%dir%def.txt) do set def=%%G
  for /f "tokens=* delims=," %%G in (%dir%spd.txt) do set spd=%%G
  for /f "tokens=* delims=," %%G in (%dir%maxmana.txt) do set maxmana=%%G
  for /f "tokens=* delims=," %%G in (%dir%mana.txt) do set mana=%%G
  for /f "tokens=* delims=," %%G in (%mdir%rathp.txt) do set rathp=%%G
  for /f "tokens=* delims=," %%G in (%mdir%ratatk.txt) do set ratatk=%%G
  for /f "tokens=* delims=," %%G in (%mdir%ratdef.txt) do set ratdef=%%G
  for /f "tokens=* delims=," %%G in (%mdir%ratspd.txt) do set ratspd=%%G
  cls
    echo/
    echo Enemy: Rat		:		Player: %name%
    echo Health: %rathp%		:		Health: %hp%
    echo Attack: %ratatk%		:		Attack: %atk%
    echo Defense: %ratdef%		:		Defense: %def%
    echo Speed: %ratspd%		:		Speed: %spd%
    Echo/
      Echo 1: Attack     2:Block     3. Skills     4. Run
    echo/
    echo Here is where you can decide what to do
    echo We have nowhere to run so for now
    echo We must fight!
      choice.exe /C 1234 /N /M "Press 1 to attack"
      if %errorlevel% equ 4 goto sf
      if %errorlevel% equ 3 goto sf
      if %errorlevel% equ 2 goto sf
      if %errorlevel% equ 1 goto TutorialRatYourAtk
        :TutorialRatYourAtk
          for /f "tokens=* delims=," %%G in (%dir%spd.txt) do set calcspd=%%G
          for /f "tokens=* delims=," %%G in (%mdir%ratspd.txt) do set calcratspd=%%G
          set /a chance=100+%calcspd%-%calcratspd%
          set /a "value = %random% %% 100"
          if %value% GEQ %chance% goto Miss else (
          for /f "tokens=* delims=," %%G in (%dir%atk.txt) do set calcatk=%%G
          for /f "tokens=* delims=," %%G in (%mdir%ratdef.txt) do set calcdef=%%G
          set /a dmg=calcatk-(calcdef/2)
          set/p "val=" <%mdir%rathp.txt
          set/a "val-=%dmg%"
          (echo(%val%)>%mdir%rathp.txt
          Echo You attack the Rat and deal %dmg%
        :TutorialRatEnemyAtk
          for /f "tokens=* delims=," %%G in (%mdir%rathp.txt) do set number=%%G
          if %number% LEQ 0 goto TutorialRatDeath else (
          for /f "tokens=* delims=," %%G in (%dir%spd.txt) do set calcspd=%%G
          for /f "tokens=* delims=," %%G in (%mdir%ratspd.txt) do set calcratspd=%%G
          set /a chance=100-%calcspd%+%calcratspd%
          set /a "value = %random% %% 100"
          if %value% GEQ %chance% goto RatMiss else (
          for /f "tokens=* delims=," %%G in (%mdir%ratatk.txt) do set calcatk=%%G
          for /f "tokens=* delims=," %%G in (%dir%def.txt) do set calcdef=%%G
          set /a dmg=calcatk-(calcdef/2)
          if %dmg% leq 0 set dmg=1
          set/p "val=" <%dir%hp.txt
          set/a "val-=%dmg%"
          (echo(%val%)>%dir%hp.txt
          Echo The Rat deals %dmg% to you!
          for /f "tokens=* delims=," %%G in (%dir%hp.txt) do set phealth=%%G
          if %phealth% LEQ 0 goto Death else (
          @echo.
          pause
        goto %bid%
        :sf
          echo You don't have time for that
          echo Press 1 to attack the Enemy!
          pause
        Goto TutorialRat

:TutorialRatDeath
  Echo 1 >> %mdir%RatCount.txt
  Del %mdir%rathp.txt
  Del %mdir%ratatk.txt
  Del %mdir%ratdef.txt
  Del %mdir%ratspd.txt
    echo/
    echo After a short fight
    echo You swiftly execute the Rat.
    echo/
    echo You have finished the game!
    echo ...for now.....
  pause
    echo Sike, another battle
    echo but... Slightly harder
  pause
Goto 2

:2
  del %dir%save.txt
  del %dir%BattleID.txt
    Echo 2 >>%dir%Save.txt
    Del %mdir%rathp.txt
    Del %mdir%ratatk.txt
    Del %mdir%ratdef.txt
    Del %mdir%ratspd.txt
  cls
      Echo PreRat >> %dir%BattleID.txt
      Echo 6 >> %mdir%rathp.txt
      Echo 2 >> %mdir%ratatk.txt
      Echo 4 >> %mdir%ratdef.txt
      Echo 3 >> %mdir%ratspd.txt
  for /f "tokens=* delims=," %%G in (%dir%battleid.txt) do set bid=%%G
Goto Mana

:Mana
  for /f "tokens=* delims=," %%G in (%dir%mana.txt) do set mana=%%G
  for /f "tokens=* delims=," %%G in (%dir%maxmana.txt) do set maxmana=%%G
  if %Mana% GEQ %MaxMana% goto PreTurn else (
  set/p "val=" <%dir%mana.txt
  set/a "val+=1"
  (echo(%val%)>%dir%mana.txt
  echo You recovered 1 mana!
  pause

:PreTurn
  If exist "%pdir%\AtkBuffDuration.txt" (
    Goto AtkBuff
  )
  If exist "%pdir%\DefBuffDuration.txt" (
    Goto DefBuff
  )
  If exist "%pdir%\SpdBuffDuration.txt" (
    Goto SpdBuff
  )
goto %bid%

:AtkBuff
  for /f "tokens=* delims=," %%G in (%pdir%AtkBuffDuration.txt) do set ABTurns=%%G
  if %ABTurns% LEQ 0 goto %bid% else (
  set/p "val=" <%pdir%AtkBuffDuration.txt
  set/a "val-=1"
  (echo(%val%)>%pdir%AtkBuffDuration.txt
    for /f "tokens=* delims=," %%G in (%pdir%AtkBuffDuration.txt) do set ABDuration=%%G
    if %ABDuration% GEQ 1 goto %bid% else (
    for /f "tokens=* delims=," %%G in (%dir%Atk.txt) do set BAtk=%%G
    for /f "tokens=* delims=," %%G in (%pdir%AtkBuffAmount.txt) do set ABA=%%G
    set /a dif=BAtk-ABA
    (echo(%dif%)>%dir%Atk.txt
      del %pdir%AtkBuffDuration.txt
      del %pdir%AtkBuffAmount.txt
Goto %bid%

:DefBuff
  Echo none
Goto %bid%

:SpdBuff
  Echo none
Goto %bid%

:PreRat
  Del %dir%BattleID.txt
  Echo PreRat >> %dir%BattleID.txt
  for /f "tokens=* delims=," %%G in (%mdir%RatCount.txt) do set RC=%%G
    if %RC% GEQ 1000 goto PreDRat else (
  set /a rchance=0+%RC%
  set /a "value = %random% %% 1000"
  if %value% LEQ %rchance% goto PreDRat else (
  @Echo.
  Del %dir%BattleID.txt
  Del %mdir%rathp.txt
  Del %mdir%ratatk.txt
  Del %mdir%ratdef.txt
  Del %mdir%ratspd.txt
  Echo Rat >> %dir%BattleID.txt
  Echo 6 >> %mdir%rathp.txt
  Echo 2 >> %mdir%ratatk.txt
  Echo 4 >> %mdir%ratdef.txt
  Echo 3 >> %mdir%ratspd.txt
Goto Rat

:Rat
    for /f "tokens=* delims=," %%G in (%dir%BattleID.txt) do set bid=%%G
  for /f "tokens=* delims=," %%G in (%dir%hp.txt) do set hp=%%G
  for /f "tokens=* delims=," %%G in (%dir%atk.txt) do set atk=%%G
  for /f "tokens=* delims=," %%G in (%dir%def.txt) do set def=%%G
  for /f "tokens=* delims=," %%G in (%dir%spd.txt) do set spd=%%G
  for /f "tokens=* delims=," %%G in (%dir%maxmana.txt) do set maxmana=%%G
  for /f "tokens=* delims=," %%G in (%dir%mana.txt) do set mana=%%G
  for /f "tokens=* delims=," %%G in (%mdir%rathp.txt) do set rathp=%%G
  for /f "tokens=* delims=," %%G in (%mdir%ratatk.txt) do set ratatk=%%G
  for /f "tokens=* delims=," %%G in (%mdir%ratdef.txt) do set ratdef=%%G
  for /f "tokens=* delims=," %%G in (%mdir%ratspd.txt) do set ratspd=%%G
  cls
    echo/
    echo Enemy: Rat		:		Player: %name%
    echo Health: %rathp%		:		Health: %hp%
    echo Attack: %ratatk%		:		Attack: %atk%
    echo Defense: %ratdef%		:		Defense: %def%
    echo Speed: %ratspd%		:		Speed: %spd%
    Echo/
      Echo 1: Attack     2:Block     3. Skills     4. Run
    echo/
      choice.exe /C 1234 /N /M "What will you do?"
      if %errorlevel% equ 4 goto Flee
      if %errorlevel% equ 3 goto Skill
      if %errorlevel% equ 2 goto Def
      if %errorlevel% equ 1 goto RatYourAtk
    :RatYourAtk
      for /f "tokens=* delims=," %%G in (%dir%spd.txt) do set calcspd=%%G
      for /f "tokens=* delims=," %%G in (%mdir%ratspd.txt) do set calcratspd=%%G
      set /a chance=100+%calcspd%-%calcratspd%
      set /a "value = %random% %% 100"
      if %value% GEQ %chance% goto Miss else (
      for /f "tokens=* delims=," %%G in (%dir%atk.txt) do set calcatk=%%G
      for /f "tokens=* delims=," %%G in (%mdir%ratdef.txt) do set calcdef=%%G
      set /a dmg=calcatk-(calcdef/2)
      set/p "val=" <%mdir%rathp.txt
      set/a "val-=%dmg%"
      (echo(%val%)>%mdir%rathp.txt
      Echo You attack the Rat and deal %dmg%
    :RatEnemyAtk
      for /f "tokens=* delims=," %%G in (%mdir%rathp.txt) do set number=%%G
      if %number% LEQ 0 goto RatDeath else (
      for /f "tokens=* delims=," %%G in (%dir%spd.txt) do set calcspd=%%G
      for /f "tokens=* delims=," %%G in (%mdir%ratspd.txt) do set calcratspd=%%G
      set /a chance=100-%calcspd%+%calcratspd%
      set /a "value = %random% %% 100"
      if %value% GEQ %chance% goto RatMiss else (
      for /f "tokens=* delims=," %%G in (%mdir%ratatk.txt) do set calcatk=%%G
      for /f "tokens=* delims=," %%G in (%dir%def.txt) do set calcdef=%%G
      set /a dmg=calcatk-(calcdef/2)
      if %dmg% leq 0 set dmg=1
      set/p "val=" <%dir%hp.txt
      set/a "val-=%dmg%"
      (echo(%val%)>%dir%hp.txt
      Echo The Rat deals %dmg% to you!
      for /f "tokens=* delims=," %%G in (%dir%hp.txt) do set phealth=%%G
      if %phealth% LEQ 0 goto Death else (
      @echo.
      pause
goto %bid%

:PreDRat
  del %dir%BattleID.txt
  Del %mdir%drathp.txt
  Del %mdir%dratatk.txt
  Del %mdir%dratdef.txt
  Del %mdir%dratspd.txt
  Echo DemonicRat >> %dir%BattleID.txt
  Echo 30 >> %mdir%drathp.txt
  Echo 10 >> %mdir%dratatk.txt
  Echo 0 >> %mdir%dratdef.txt
  Echo 8 >> %mdir%dratspd.txt
  cls
goto DemonicRat

:DemonicRat
  for /f "tokens=* delims=," %%G in (%dir%battleid.txt) do set bid=%%G
  for /f "tokens=* delims=," %%G in (%dir%hp.txt) do set hp=%%G
  for /f "tokens=* delims=," %%G in (%dir%atk.txt) do set atk=%%G
  for /f "tokens=* delims=," %%G in (%dir%def.txt) do set def=%%G
  for /f "tokens=* delims=," %%G in (%dir%spd.txt) do set spd=%%G
  for /f "tokens=* delims=," %%G in (%dir%maxmana.txt) do set maxmana=%%G
  for /f "tokens=* delims=," %%G in (%dir%mana.txt) do set mana=%%G
  for /f "tokens=* delims=," %%G in (%mdir%drathp.txt) do set drathp=%%G
  for /f "tokens=* delims=," %%G in (%mdir%dratatk.txt) do set dratatk=%%G
  for /f "tokens=* delims=," %%G in (%mdir%dratdef.txt) do set dratdef=%%G
  for /f "tokens=* delims=," %%G in (%mdir%dratspd.txt) do set dratspd=%%G
  cls
    echo/
    echo Enemy: Demonic Rat		:		Player: %name%
    echo Health: %drathp%		:		Health: %hp%
    echo Attack: %dratatk%		:		Attack: %atk%
    echo Defense: %dratdef%		:		Defense: %def%
    echo Speed: %dratspd%		:		Speed: %spd%
    Echo/
      Echo 1: Attack     2:Block     3. Skills     4. Run
    echo/
      choice.exe /C 1234 /N /M "What will you do?"
      if %errorlevel% equ 4 goto Flee
      if %errorlevel% equ 3 goto Skill
      if %errorlevel% equ 2 goto Def
      if %errorlevel% equ 1 goto DemonicRatYourAtk
    :DemonicRatYourAtk
      for /f "tokens=* delims=," %%G in (%dir%spd.txt) do set calcspd=%%G
      for /f "tokens=* delims=," %%G in (%mdir%dratspd.txt) do set calcdratspd=%%G
      set /a chance=100+%calcspd%-%calcdratspd%
      set /a "value = %random% %% 100"
      if %value% GEQ %chance% goto Miss else (
      for /f "tokens=* delims=," %%G in (%dir%atk.txt) do set calcatk=%%G
      for /f "tokens=* delims=," %%G in (%mdir%dratdef.txt) do set calcdef=%%G
      set /a dmg=calcatk-(calcdef/2)
      set/p "val=" <%mdir%drathp.txt
      set/a "val-=%dmg%"
      (echo(%val%)>%mdir%drathp.txt
      Echo You attack the Demonic Rat and deal %dmg%
    :DemonicRatEnemyAtk
      for /f "tokens=* delims=," %%G in (%mdir%drathp.txt) do set number=%%G
      if %number% LEQ 0 goto DRatDeath else (
      for /f "tokens=* delims=," %%G in (%dir%spd.txt) do set calcspd=%%G
      for /f "tokens=* delims=," %%G in (%mdir%dratspd.txt) do set calcdratspd=%%G
      set /a chance=100-%calcspd%+%calcdratspd%
      set /a "value = %random% %% 100"
      if %value% GEQ %chance% goto RatMiss else (
      for /f "tokens=* delims=," %%G in (%mdir%dratatk.txt) do set calcatk=%%G
      for /f "tokens=* delims=," %%G in (%dir%def.txt) do set calcdef=%%G
      set /a dmg=calcatk-(calcdef/2)
      if %dmg% leq 0 set dmg=1
      set/p "val=" <%dir%hp.txt
      set/a "val-=%dmg%"
      (echo(%val%)>%dir%hp.txt
      Echo The Demonic Rat deals %dmg% to you!
      for /f "tokens=* delims=," %%G in (%dir%hp.txt) do set phealth=%%G
      if %phealth% LEQ 0 goto Death else (
      @echo.
      pause
goto %bid%

:Def
  echo The rat attacks you!
  echo You blocked the rats attack!
  pause
Goto Mana

:Skill
  choice.exe /C 12 /N /M "1. Attack	2. Buff"
  if %errorlevel% equ 2 goto BuffSkill1
  if %errorlevel% equ 1 goto AtkSkill1
  :AtkSkill1
    Echo/
    dir /A /B %sdir% | findstr /R ".">Nul && goto ASDisplay
  :NoSkill
    echo You have no skills!
    pause
  Goto %bid%
  :ASDisplay
    If exist "%asdir%\Blink. " (
    Echo 1: Blink
    ) Else (
    Echo 1: ???
    )
    Echo 2: ???
    Echo 3: ???
    Echo 4: ???
    Echo 5: ???
    Echo 6: ???
    Echo 7: ???
    Echo 8: ???
    echo 9. Next Page
    echo 0. Back
      choice.exe /C 1234567890 /N /M ""
      if %errorlevel% equ 10 goto %bid%
      if %errorlevel% equ 9 goto ASDisplay2
      if %errorlevel% equ 8 goto aa
      if %errorlevel% equ 7 goto aa
      if %errorlevel% equ 6 goto aa
      if %errorlevel% equ 5 goto aa
      if %errorlevel% equ 4 goto aa
      if %errorlevel% equ 3 goto aa
      if %errorlevel% equ 2 goto aa
      if %errorlevel% equ 1 goto Blink
  :ASDisplay2
    echo working
    pause
  goto ASDisplay
  goto aa
  :BuffSkill1
    Echo/
    dir /A /B %sdir% | findstr /R ".">Nul && goto BSDisplay
  :NoSkill
    echo You have no skills!
    pause
  goto %bid%
  :BSDisplay
    If exist "%bsdir%\Sharpen. " (
    Echo 1: Sharpen
    ) Else (
    Echo 1: ???
    )
        If exist "%bsdir%\Heal. " (
    Echo 2: Heal
    ) Else (
    Echo 2: ???
    )
    Echo 3: ???
    Echo 4: ???
    Echo 5: ???
    Echo 6: ???
    Echo 7: ???
    Echo 8: ???
    echo 9. Next Page
    echo 0. Back
      choice.exe /C 1234567890 /N /M ""
      if %errorlevel% equ 10 goto %bid%
      if %errorlevel% equ 9 goto BSDisplay2
      if %errorlevel% equ 8 goto aa
      if %errorlevel% equ 7 goto aa
      if %errorlevel% equ 6 goto aa
      if %errorlevel% equ 5 goto aa
      if %errorlevel% equ 4 goto aa
      if %errorlevel% equ 3 goto aa
      if %errorlevel% equ 2 goto Heal
      if %errorlevel% equ 1 goto Sharpen
  :BSDisplay2
    echo working
    pause
  goto BSDisplay

:Flee
  for /f "tokens=* delims=," %%G in (%dir%spd.txt) do set calcspd=%%G
  for /f "tokens=* delims=," %%G in (%mdir%ratspd.txt) do set calcratspd=%%G
  set /a chance=50+%calcspd%-%calcratspd%
  set /a "value = %random% %% 100"
  if %value% LEQ %chance% goto Escape else (
    for /f "tokens=* delims=," %%G in (%mdir%ratatk.txt) do set calcatk=%%G
    for /f "tokens=* delims=," %%G in (%dir%def.txt) do set calcdef=%%G
    set /a dmg=calcatk-(calcdef/2)
    set/p "val=" <%dir%hp.txt
    set/a "val-=%dmg%"
    (echo(%val%)>%dir%hp.txt
    Echo You failed to escape!
    Echo The rat deals %dmg% to you!
  pause
Goto %bid%

:Escape
  echo freeedooommm
  pause
goto aa

:NoMana
  echo You don't have enough mana for that!
  pause
goto %bid%

:CantBuff
  echo You are already buffed!
  pause
goto %bid%

:aa
goto %bid%

:Death
  echo fucking rippp
  pause

:RatDeath
  echo rat a dead mf
  echo but his friend aint
  pause
  set/p "count=" <%mdir%RatCount.txt
  set/a "count+=1"
  (echo(%count%)>%mdir%RatCount.txt
  Del %mdir%rathp.txt
  Del %mdir%ratatk.txt
  Del %mdir%ratdef.txt
  Del %mdir%ratspd.txt
goto %save%

:DRatDeath
  echo You have slayed the Demonic Rat
  del %mdir%RatCount.txt
  Echo 0 >> %mdir%RatCount.txt
  Del %mdir%drathp.txt
  Del %mdir%dratatk.txt
  Del %mdir%dratdef.txt
  Del %mdir%dratspd.txt
  pause
goto %save%

:Ratmiss
  echo The enemies attack missed!
  pause
goto %bid%

:Miss
  echo Your attack missed!
goto %bid%

:Blink
  for /f "tokens=* delims=," %%G in (%dir%mana.txt) do set mana=%%G
  if %Mana% LEQ 6 goto NoMana else (
  set/p "val=" <%dir%mana.txt
  set/a "val-=7"
  (echo(%val%)>%dir%mana.txt
    for /f "tokens=* delims=," %%G in (%dir%atk.txt) do set calcatk=%%G
    for /f "tokens=* delims=," %%G in (%dir%ratdef.txt) do set calcdef=%%G
    set /a dmg=calcatk+(calcatk/2)-(calcdef/2)
    set/p "val=" <%dir%rathp.txt
    set/a "val-=%dmg%"
    (echo(%val%)>%dir%rathp.txt
    Echo You used Blink and dealt %dmg% damage.
  pause
if %bid% Equ DemonicRat goto DemonicRatEnemyAtk
if %bid% Equ Rat goto RatEnemyAtk

:Heal
  for /f "tokens=* delims=," %%G in (%dir%Hp.txt) do set CHP=%%G
  for /f "tokens=* delims=," %%G in (%dir%MaxHp.txt) do set MHP=%%G
  if %CHP% GEQ %MHP% goto FullHP else (
  for /f "tokens=* delims=," %%G in (%dir%mana.txt) do set mana=%%G
  if %Mana% LEQ 10 goto NoMana else (
  set/p "val=" <%dir%mana.txt
  set/a "val-=10"
  (echo(%val%)>%dir%mana.txt
    set /a "Heal=MHP/10"
    if %Heal% Equ 0 set Heal=1
    set/a "CHP+=Heal"
    if %CHP% GEq %MHP% set /a "Heal=MHP+Heal-CHP"
    if %CHP% GEq %MHP% set /a "CHP=MHP"
    (echo(%CHP%)>%dir%hp.txt
    Echo You have healed %Heal% health!
  pause
if %bid% Equ DemonicRat goto DemonicRatEnemyAtk
if %bid% Equ Rat goto RatEnemyAtk

:Sharpen
  If exist "%pdir%\AtkBuffDuration.txt" (
  Goto CantBuff
  )
    for /f "tokens=* delims=," %%G in (%dir%mana.txt) do set mana=%%G
    if %Mana% LEQ 6 goto NoMana else (
    set/p "val=" <%dir%mana.txt
    set/a "val-=5"
    (echo(%val%)>%dir%mana.txt
    echo 2 >>%pdir%AtkBuffDuration.txt
      for /f "tokens=* delims=," %%G in (%dir%atk.txt) do set a1=%%G
      set /a "aboost=a1/10"
      if %aboost% Equ 0 set aboost=1
      echo Attack increased by %aboost%!
      echo %aboost% >>%pdir%AtkBuffAmount.txt
        set/p "val=" <%dir%atk.txt
        set/a "val+=%aboost%"
        (echo(%val%)>%dir%atk.txt
if %bid% Equ DemonicRat goto DemonicRatEnemyAtk
if %bid% Equ Rat goto RatEnemyAtk

:FullHP
  echo You can't heal anymore!
  pause
goto %bid%

:CantBuff
  echo You are already buffed!
  pause
goto %bid%
