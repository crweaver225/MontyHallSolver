{-# LANGUAGE NumericUnderscores #-}

import System.Random (randomRIO)
import Control.Monad (replicateM)

simulateMontyHall :: Bool -> IO Bool 
simulateMontyHall switchDoor = do

    playerChoice <- randomRIO(0 :: Int, 2) 
    prizeDoor <- randomRIO(0 :: Int, 2)

    let possibleDoors = [0,1,2]
        hostChoices = filter (\d -> d /= playerChoice && d /= prizeDoor) possibleDoors 
    
    hostChoice <- case hostChoices of 
        [x] -> return x 
        xs -> do 
            index <- randomRIO(0,1)
            return (xs !! index)
    
    let finalChoice = 
            if switchDoor 
                then head $ filter (\d -> d /= playerChoice && d /= hostChoice) possibleDoors
                else playerChoice

    return (finalChoice == prizeDoor)

main :: IO ()
main = do

    let numTrials = 1_000_000

    playerSwitches <- replicateM numTrials $ simulateMontyHall True 
    playerStays <- replicateM numTrials $ simulateMontyHall False 

    let playerSwitchesWins = length $ filter id playerSwitches
        playerStaysWins = length $ filter id playerStays
    
    let playerSwitchesWinPercentage :: Double 
        playerSwitchesWinPercentage = fromIntegral playerSwitchesWins * 100 / fromIntegral numTrials
    let playerStaysWinPercentage :: Double
        playerStaysWinPercentage = fromIntegral playerStaysWins * 100 / fromIntegral numTrials
    
    putStrLn $ "\nMonty Hall Simulation Results (" ++ show numTrials ++ " trials):"
    putStrLn "--------------------------------------------"
    putStrLn $ "Always SWITCH strategy win rate:   " ++ show playerSwitchesWinPercentage ++ "%"
    putStrLn $ "Always STAY strategy win rate: " ++ show playerStaysWinPercentage ++ "%"

    putStrLn "\nSuggested best strategy: "
    if playerSwitchesWinPercentage > playerStaysWinPercentage
        then putStrLn "Always Switch\n"
        else putStrLn "Always Stay\n"


