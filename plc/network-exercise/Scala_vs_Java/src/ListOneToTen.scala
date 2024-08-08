package com.esl.scala.demo

object ListOneToTen {
  def main(args : Array[String]) : Unit = {
    val listOneToTen = listToTen(1)

    println(listOneToTen)
    println((1 to 10) toList)
    println((1 to 10) toStream)
  }

  def listToTen(i : Int) : List[Int] = {
    if(i <= 10){
      i :: listToTen(i + 1)
    }
    else{
      Nil
    }
  }
}
