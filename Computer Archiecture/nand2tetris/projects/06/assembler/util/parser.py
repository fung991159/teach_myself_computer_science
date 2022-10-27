import re


class Parser:
    """Reading and parsing commands., unpack each underlying fields

    for each line
        1. ignore space / comment
        2. if A instruction and integer, convert to binary
        3. if C instruction, extract each component
        4. (pending) Symbols
    """

    def __init__(self, file_path) -> None:
        self.pos = 0
        self.current_command: str = None
        # self.command_type_mapping = {"//": "comment", "": "blank", "@": "a_inst"}
        with open(file_path) as f:
            raw_lines = [r.strip() for r in f.readlines()]
            self.commands = []
            for line in raw_lines:
                if not (line.startswith("//") or line == ""):
                    self.commands.append(line)
        self.raw_len = len(self.commands)

    @property
    def has_more_lines(self) -> bool:
        return self.pos < self.raw_len

    def advance(self) -> None:
        self.current_command = self.commands[self.pos]
        self.pos += 1

    @property
    def instruction_type(self) -> str:
        if self.current_command.startswith("@"):
            return "a_inst"
        elif self.current_command.startswith("(") and self.current_command.endswith(
            ")"
        ):
            return "l_inst"
        else:
            return "c_inst"

    @property
    def symbol(self):
        cleaned_current_command = self.current_command.split("//")[0].strip()
        if self.instruction_type == "a_inst":
            return cleaned_current_command.replace("@", "")
        elif self.instruction_type == "l_inst":
            return cleaned_current_command.replace("(", "").replace(")", "")

    @property
    def dest(self):
        output = self.current_command.split("//")[0].strip()
        if "=" in output:
            return output.split("=")[0]

    @property
    def comp(self):
        output = self.current_command.split("//")[0].strip()
        if "=" in output:
            output = output.split("=")[1]

        if ";" in output:
            output = output.split(";")[0]

        return output

    @property
    def jump(self):
        output = self.current_command.split("//")[0].strip()
        if ";" in output:
            return output.split(";")[-1]


if __name__ == "__main__":
    from rich import print

    file_path = "dev/asset/Add.asm"

    p = Parser(file_path=file_path)
    # print(p.current_command)
    # print(p.advance())
    # print(p.current_command)
    # print(p.instruction_type)
    # print(p.comp)
    # print(p.dest)
    # print(p.jump)

    for c in p.commands:
        print(c)
    # print(p.commands)
    # while True:
    #     if p.has_more_commands():
    #         p.advance()

    #         print(p.label)
    #         print(p.current_command)
    #         print(p.dest)
    #         print(p.comp)
    #         print(p.jump)

    #     else:
    #         break
