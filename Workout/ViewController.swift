//
//  ViewController.swift
//  Workout
//
//  Created by Max Mender on 3/25/19.
//  Copyright © 2019 Max Mender. All rights reserved.
//

import UIKit

//Variable Declarations

var triWorkouts = ["Bench", "Arnold Press", "Tricep Extensions", "Chest Fly's"]
var triAux = ["Push Ups", "Skull Crushers", "Closed Grip Bench", "Tricep Pull Down", "Bent-Over Tricep Extrensions", "Burpees"]
var legWorkouts = ["Squat", "Barbell Deadlift", "Seated Leg Extensions", "Lying Hamstring Curls", "Leg Press"]
var legAux = ["One-Leg Body Squats", "Dumb-bell Lunges", "Bulgarian Split Squat", "Burpees"]
var cardio = ["Run 1 Mile", "Run 2 Miles", "Row 5 Minutes", "Five 100m Sprints", "Spin Bike", "Stair Stepper"]
var chosenBody = [""]
var randomNum = 1

class ViewController: UIViewController
{
    @IBOutlet weak var selectLbl: UILabel! //VERY TOP LABEL
    @IBOutlet weak var Lifts: UILabel! //First set of lifts label
    @IBOutlet weak var lift2Lbl: UILabel! //Second set of lifts label
    @IBOutlet weak var startTap: UIButton! //First workout button
    @IBOutlet weak var startTap2: UIButton! //Second Workout button
    @IBOutlet weak var setsReps: UILabel! //First sets & reps lbl
    @IBOutlet weak var setsReps2: UILabel! //Second sets & reps lbl
    @IBOutlet weak var cardioLbl: UILabel! //Cardio lbl
    @IBOutlet weak var cardioButt: UIButton! //Cardio Button
    
//===================================================================================================
    @IBAction func workout(_ sender: Any) //What happens when fist workout button tapped
    {
	startTap.setTitleColor(UIColor.lightText, for: .normal)
    selectLbl.text = "Here's Your Lifts!"
	
		chosenBody = randomBody()
		
		Lifts.text = ("\(randomLift())\n\n\(randomLift())\n\n\(randomAux())")
        
        setsReps.text = ("\(randomSets()) X \(randomReps())\n\n\(randomSets()) X \(randomReps())\n\n\(randomSets()) X \(randomReps())")

		startTap.isUserInteractionEnabled = false
	
    }
//==================================================================================================
    @IBAction func Lift2(_ sender: Any) //What happens when second workout button tapped
    {
		chosenBody = randomBody()
		
		startTap2.setTitleColor(UIColor.lightText, for: .normal)
	
		lift2Lbl.text = ("\(randomLift())\n\n\(randomLift())\n\n\(randomAux())")
        
        setsReps2.text = ("\(randomSets()) X \(randomReps())\n\n\(randomSets()) X \(randomReps())\n\n\(randomSets()) X \(randomReps())")
		
			startTap2.isUserInteractionEnabled = false
	
    }
//===================================================================================================
    @IBAction func cardioTap(_ sender: Any)
    {
        cardioLbl.text = ("\(randomCardio())")
		cardioButt.isUserInteractionEnabled = false
		cardioButt.setTitleColor(UIColor.lightText, for: .normal)
    }
    func randomSets() -> Int
	{
		let randSets = (Int(arc4random() % 3) + 3)
		return (randSets)
	}
//===================================================================================================
	func randomReps() -> Int
	{
		let randReps = (Int(arc4random() % 9) + 3)
		return (randReps)
	}
//===================================================================================================
	func randomBody() -> [String]
	{
		var myWorkouts = [legWorkouts, triWorkouts]
		randomNum = Int(arc4random()) % myWorkouts.count
		chosenBody = myWorkouts[randomNum]
		
		return (chosenBody)
	}
//===================================================================================================
	func randomLift() -> String
	{
		randomNum = Int(arc4random()) % chosenBody.count
		let chosenLift = chosenBody[randomNum]
		
		return (chosenLift)
	}
	
//===================================================================================================
	func randomAux() -> String
	{
		var chosenAux = ""
		
		if (chosenBody == triWorkouts)
		{
			randomNum = Int(arc4random()) % triAux.count
			chosenAux = triAux[randomNum]
		}
		else if (chosenBody == legWorkouts)
		{
			randomNum = Int(arc4random()) % legAux.count
			chosenAux = legAux[randomNum]
		}
		
		return (chosenAux)
	}
    
    func randomCardio() -> String
    {
        var chosenCardio = ""
        randomNum = Int(arc4random()) % cardio.count
        chosenCardio = cardio[randomNum]
        
        return (chosenCardio)
    }
	
//===================================================================================================
    override func viewDidLoad()
    {
		startTap.layer.cornerRadius = 10
		startTap.clipsToBounds = true
		startTap2.layer.cornerRadius = 10
		startTap2.clipsToBounds = true
		cardioButt.layer.cornerRadius = 10
		cardioButt.clipsToBounds = true
		

        super.viewDidLoad()
    }
}

//===================================================================================================
extension UITabBar
{
	override open func sizeThatFits(_ size: CGSize) -> CGSize
	{
		return CGSize(width: UIScreen.main.bounds.width, height: 70)
		
	}
}

