import abc


class Code:
    """translate Mnemonic to Binary"""

    def __init__(self):
        pass

    def to_binary(self, inst: str):
        """distinguish if it is A or C instruction, then call handling helper function"""

        if inst.startswith("@"):
            output = self._a_inst_to_binary(label=inst[1:])
        else:
            output = self._c_inst_to_binary(inst=inst)
        return output

    def _a_inst_to_binary(self, inst: str):
        if inst.isdigit():
            return f"{int(inst):015b}"
        else:
            pass

    def _c_inst_to_binary(self, c_inst: str, part: str):
        pass

    def _c_inst_dest(self, dest_symbol):
        dest = {
            "M": "001",
            "D": "010",
            "MD": "011",
            "A": "100",
            "AM": "101",
            "AD": "110",
            "AMD": "111",
        }

        return dest.get(dest_symbol, "000")

    def _c_inst_comp(self, comp_symbol):
        comp = {
            # a=0
            "0": "0101010",
            "1": "0111111",
            "-1": "111010",
            "D": "001100",
            "A": "110000",
            "!D": "001101",
            "!A": "110001",
            "-D": "001111",
            "-A": "110011",
            "D+1": "011111",
            "A+1": "110111",
            "D-1": "001110",
            "A-1": "110010",
            "D+A": "000010",
            "D-A": "010011",
            "A-D": "000111",
            "D&A": "000000",
            "D|A": "010101",
        }
        pass

    def _c_inst_jump(self, jump_symbol):
        jump = {
            "JGT": "001",
            "JEQ": "010",
            "JGE": "011",
            "JLT": "100",
            "JNE": "101",
            "JLE": "110",
            "JMP": "111",
        }
        return jump.get(jump_symbol, "000")


if __name__ == "__main__":
    from rich import print

    c = Code()
    result = c.to_binary("@100")
    print(result)
