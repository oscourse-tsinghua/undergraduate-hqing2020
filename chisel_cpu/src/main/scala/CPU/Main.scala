package CPU

object Main extends App{
  chisel3.Driver.execute(args, () => new IMemory)
}
