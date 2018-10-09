
from myhdl import block, delay, always, toVHDL, Signal, toVerilog, intbv, always_comb
import tensorflow as tf

#


@block
def HelloWorld():
    def say_hello():
        hello = tf.constant("Hello, TensorFlow!")
        sess = tf.Session()
        print(sess.run(hello))
    return say_hello

inst = HelloWorld()