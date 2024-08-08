package com.esl.scala.demo

class MixinTraits {

  abstract class Table[K, V](defaultValue : V){
    def get(key : K) : Option[V]
    def put(key : K, value : V) : Unit
    def apply(key : K) : V = {
      get(key) match {
        case Some(value) => value
        case None => defaultValue
      }
    }
  }

  class MapTable[K, V](defaultValue : V) extends Table[K, V](defaultValue){
    private var map  = Map.empty[K, V]
    def get(key : K) = map.get(key)
    def put(key : K, value : V) = {
      map = map.updated(key, value)
    }
  }

  trait ConcurrentTable[K, V] extends Table[K, V]{
    abstract override def get(key : K) = synchronized { super.get(key)}
    abstract override def put(key : K, value: V) = synchronized { super.put(key, value)}
  }

  class AwesomeTable[K, V](defaultValue : V) extends MapTable[K, V](defaultValue) with ConcurrentTable[K, V]

  def main (args: Array[String]) : Unit = {
    val t1 = new MapTable[Int, String]("None") with ConcurrentTable[Int, String]
    val t2 = new AwesomeTable[Int, String]("None")

    println(t1.get(5))
    println(t2.get(5))
  }
}
