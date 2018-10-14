robot (name, attack, hp) = \message -> message (name, attack, hp)

name (n,_,_) = n
attack (_,a,_) = a
hp (_,_,hp) = hp

getName aRobot = aRobot name
getAttack aRobot = aRobot attack
getHp aRobot = aRobot hp

setName aRobot newName = aRobot (\(_,a,h) -> robot (newName,a,h))
setAttack aRobot newAttack = aRobot (\(n,_,h) -> robot (n,newAttack,h))
setHp aRobot newHp = aRobot (\(n,a,_) -> robot (n,a,newHp))

printRobot aRobot = aRobot (\(n,a,h) -> n ++
                                        " attack:" ++ (show a) ++
                                        " hp:" ++ (show h))

damage aRobot attackDamage = aRobot (\(n,a,h) ->
                                           robot (n,a,h - attackDamage))

fight aRobot defender = damage defender attack
  where attack = if getHp aRobot > 10
                    then getAttack aRobot
                    else 0

getRobotsHealth robots = map getHp robots

-- threeRoundFight rA rB = if getHp rAr3 > getHp rBr3
--                            then rAr3
--                            else rBr3
--   where
--     rAr1 = fight rB rA
--     rBr1 = fight rAr1 rB
--     rAr2 = fight rBr1 rAr1
--     rBr2 = fight rAr2 rBr1
--     rAr3 = fight rBr2 rAr2
--     rBr3 = fight rAr3 rBr2

robots = [ robot ("A", 10, 100)
         , robot ("B", 20, 80)
         , robot ("C", 30, 40)
         ]

r4 = robot ("D", 25, 60)
fightR4 x = fight x r4

r4FightAll = map fightR4 robots

r4FightAllRemainingHealth = getRobotsHealth r4FightAll
