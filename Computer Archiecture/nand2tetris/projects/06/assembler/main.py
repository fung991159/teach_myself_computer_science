from util.parser import Parser
from util.symbol_tbl import SymbolTable
from util.code import Code


def main(file_path: str):
    # init parser & symbol table

    p = Parser(file_path=file_path)
    st = SymbolTable()
    c = Code()

    # first pass: look at labels and update symbol table
    st.first_pass(insts=p.commands)
    commands_without_label = [c for c in p.commands if st.label_patt.match(c) is None]
    for idx, inst in enumerate(p.commands):
        print(idx, inst)
    print()
    for idx, inst in enumerate(commands_without_label):
        print(idx, inst)
    print(st.mapping)

    # binary = c.to_binary(inst)
    # print(binary)
    # 1. parse command
    # 2.  if a command: symbol to Binary
    # 3. C get code for each part and put togther


def simple_version(file_path):

    p = Parser(file_path=file_path)
    c = Code()
    output = []
    while True:
        if not p.has_more_lines:
            break
        p.advance()
        if p.instruction_type == "a_inst":
            a_inst = p.current_command.replace("@", "")
            output.append(f"{int(a_inst):015b}")
        elif p.instruction_type == "c_inst":
            c_inst_binary = "111"
            c_inst_binary += c.comp(p.comp)
            c_inst_binary += c.dest(p.dest)
            c_inst_binary += c.jump(p.jump)
            output.append(c_inst_binary)
            # print(p.current_command)
            # print(c_inst_binary)
            # 111 0110000 010 000

    return zip(
        p.commands,
        output,
    )


if __name__ == "__main__":
    prefix = "dev/asset/"
    hack_file = "Add.asm"
    hack_file = "MaxL.asm"
    hack_file = "RectL.asm"
    hack_file = "PongL.asm"
    out = simple_version(file_path=prefix + hack_file)
    for e in out:
        print(e)
