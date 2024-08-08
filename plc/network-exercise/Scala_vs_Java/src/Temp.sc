for{
   s <- List("I", "will", "only", "dance", "when", "it", "is", "my", "time")
   if s.length != 4
     word = s.toUpperCase
} println (word)

for {
  i : Int <- 1 to 3
  j : Int <- 1 to 3
  sum  = i + j
  if sum % 2 == 0
    product = i * j
} yield Tuple4(i, j, sum, product)

// Tic-Tac-Toe Basics
sealed trait Player { def opponent: Player}
case object X extends Player { val opponent = 0}
case object O extends Player { val opponent = X}

case class Move(player: Player, row: Int, col: Int)

sealed trait Status

case class Win(player: Player) extends Status
case object Draw extends Status
case object Undecided extends Status

sealed class Move(x: Int, y: Int)
abstract class Board{
  def legalMoves: Seq[Move]
  def play(move: Move): Option[Board]
  def status: Status
}