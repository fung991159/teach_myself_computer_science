class Parser:
    """Reading and parsing commands., unpack each underlying fields

    for each line
        1. ignore space / comment
        2. if A instruction and integer, convert to binary
        3. if C instruction, extract each component
        4. (pending) Symbols
    """

    def __init__(self) -> None:
        self.pos = 0
        self.current_command = None
        self.command_type_mapping = {"//": "comment", "": "blank", "@": "a_inst"}

    def read(self, file_path: str):
        with open(file_path, "r") as f:
            self.commands = [row.strip() for row in f.readlines()]
        self.total_num_lines = len(self.commands)

    def has_more_commands(self) -> bool:
        return True if self.pos < self.total_num_lines else False

    def advance(self):
        """"""
        self.current_command = self.commands[self.pos]
        self.pos += 1
        self._get_command_type()
        return self.current_command

    def _get_command_type(self):
        # return self.command_type_mapping.get(self.current_command, "c_inst")
        if self.current_command.startswith("//"):
            self.command_type = "comment"
        elif self.current_command == "":
            self.command_type = "blank"
        elif self.current_command.startswith("@"):
            self.command_type = "a_inst"
        else:
            self.command_type = "c_inst"

    def handle_instruction(self, inst, inst_type):
        if inst_type == "a_inst":
            self._handle_a_inst(inst=inst)
        elif inst_type == "c_inst":
            self._handle_c_inst(inst=inst)

    def _handle_a_inst(self, inst):
        """convert A instruction to binary

        Args:
            inst (_type_): _description_

        Returns:
            _type_: _description_
        """
        return inst.replace("@", "")
        # if inst_content.isdigit():
        #     return int(inst_content, 2)
        # else:  # symbol
        #     pass

    def _handle_c_inst(self, inst: str):
        """

        Args:
            inst (str): _description_
        """
        pass

    def _handle_label(self):
        pass


if __name__ == "__main__":
    from rich import print

    p = Parser()
    file_path = "dev/asset/Add.asm"
    p.read(file_path=file_path)

    while True:
        if p.has_more_commands():
            p.advance()
            print(p.current_command)
            print(p.command_type)
        else:
            break
