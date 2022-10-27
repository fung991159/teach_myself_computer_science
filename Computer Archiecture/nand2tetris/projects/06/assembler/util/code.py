import abc


class Code:
    """translate Mnemonic to Binary"""

    def __init__(self):
        pass

    def _a_inst_to_binary(self, inst: str):
        if inst.isdigit():
            return f"{int(inst):015b}"
        else:
            pass

    def dest(self, dest_symbol):
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

    def comp(self, comp_symbol):
        comp = {
            # a=0
            "0": "0101010",
            "1": "0111111",
            "-1": "0111010",
            "D": "0001100",
            "A": "0110000",
            "!D": "0001101",
            "!A": "0110001",
            "-D": "0001111",
            "-A": "0110011",
            "D+1": "0011111",
            "A+1": "0110111",
            "D-1": "0001110",
            "A-1": "0110010",
            "D+A": "0000010",
            "D-A": "0010011",
            "A-D": "0000111",
            "D&A": "0000000",
            "D|A": "0010101",
            # a==1
            "M": "1110000",
            "!M": "1110001",
            "M+1": "1110111",
            "M-1": "1110010",
            "D+M": "1000010",
            "D-M": "1010011",
            "M-D": "1000111",
            "D&M": "1000000",
            "D|M": "1010101",
        }
        return comp[comp_symbol]

    def jump(self, jump_symbol):
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
    result = c._c_inst_to_binary("D-1", part="comp")
    print(result)
