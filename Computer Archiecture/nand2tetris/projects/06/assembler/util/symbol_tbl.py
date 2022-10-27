import re


class SymbolTable:
    def __init__(self):
        # add pre-defined symbols, keyboard
        self.free_addr = 16
        self.mapping = {
            "SP": 0,
            "LCL": 1,
            "ARG": 2,
            "THIS": 3,
            "THAT": 4,
            "R0": 0,
            "R1": 1,
            "R2": 2,
            "R3": 3,
            "R4": 4,
            "R5": 5,
            "R6": 6,
            "R7": 7,
            "R8": 8,
            "R9": 9,
            "R10": 10,
            "R11": 11,
            "R12": 12,
            "R13": 13,
            "R14": 14,
            "R15": 15,
            "SCREEN": 0x4000,
            "KBD": 0x6000,
        }
        self.label_patt = re.compile("\((.*)\)")

    def first_pass(self, insts: list[str]):
        """add labels to mapping, add variable if it doens't exists

        Args:
            insts (list[str]): the HACK docus
        """
        line_no = 0
        for line in insts:
            if m := self.label_patt.match(
                line
            ):  # this is a Labels (xxx), it  has to be defined beforfe using it
                self.mapping[m.group(1)] = line_no
                continue
            line_no += 1
            # elif line.startswith("@") and not line[1:].isdigit():  # this is a variable
            #     var_name = line[1:]
            #     if not self.mapping.get(var_name):
            #         self.mapping[var_name] = self.free_addr
            #         self.free_addr += 1

    def add_var(self, key):
        curr_address = self.free_addr
        self.mapping[key] = curr_address
        self.free_addr += 1
        return curr_address

    def second_pass(self, insts: list[str]):
        """_summary_

        Args:
            line (_type_): _description_

        Returns:
            _type_: _description_
        """
        output = []
        for line in insts:
            if line.startswith("@") and not line[1:].isdigit():
                var_name = line[1:]
                address = self.mapping.get(var_name, None)
                if address is None:
                    self.mapping[var_name] = self.free_addr
                    self.free_addr += 1
                    address = self.free_addr
                line = f"@{address}"

            output.append(line)
        return output
        # if self.mapping.get()
        # if line.startswith("@") and not line[1:].isdigit():
        #     var_name = line[1:]
        #     self.mapping[var_name] =
        # return self.mapping[label_or_variable]
        #     pass

        # pass
        # add labels / new varialbes
        # Labels
        # if inst is "(xxx)", add "xxx" and the address of the next command
        # need to be done in first pass

        # Variables
        # if inst is @xxx and not a number, add "xxx" and next free address


if __name__ == "__main__":
    from parser import Parser
    from rich import print

    p = Parser("dev/asset/Max.asm")
    st = SymbolTable()
    st.first_pass(p.commands)
    print(st.mapping)
    # translated = st.second_pass(p.commands)
    # print(p.commands)
    # print(translated)
    # patt = re.compile("\((.*)\)")
    # m = patt.match("(LOOP)")
    # print(m.group(1))
