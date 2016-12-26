function Master_DefStat(c,s,v) MS.Run('MASTER','Master_DefStat',c..';'..s..';'..v) end


        local RPG = RPGStat
         local Rubine = {}
         function Rubine.requirement() return true end
         function Rubine.teach(ch) -- Should return true if master actually decides to teach something
         end
         function Rubine.appoint(ch)
               RPG.DefStat(ch,"RubinePoints",0)
         end
         function Rubine.dismiss(ch)
              RPG.DelStat(ch,"RubinePoints")
         end
         Rubine.stats = {
                               -- Spd +25%, Atk -10%, End -5%, Int -10%, Res - 5%, Acc +5%, eva +5%
                               Speed = 25,
                               Power = -10,
                               Endurance = -10,
                               Intelligence = -10,
                               Resistance = -10,
                               Accuracy = 5,
                               Evasion = 5
                        }
         return Rubine
         
-- This was only a file in which the results of a fault "JINC" call were dumped to see what went wrong. ;)         