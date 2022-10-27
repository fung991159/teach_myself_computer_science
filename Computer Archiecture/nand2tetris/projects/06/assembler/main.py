from util.parser import Parser
from util.symbol_tbl import SymbolTable
from util.code import Code


def main(file_path: str):
    # init parser & symbol table

    p = Parser(file_path=file_path)
    st = SymbolTable()
    st.first_pass(p.commands)
    # print(st.mapping)
    # print([(idx, c) for idx, c in enumerate(p.commands)])

    c = Code()
    output = []
    while True:
        if not p.has_more_lines:
            break
        p.advance()
        if p.instruction_type == "l_inst":
            continue
        elif p.instruction_type == "a_inst":
            if p.symbol.isdigit():
                output.append(f"{int(p.symbol):016b}")
            else:
                address = st.mapping.get(p.symbol, None)
                if address is None:
                    address = st.add_var(p.symbol)
                output.append(f"{int(address):016b}")

        elif p.instruction_type == "c_inst":
            c_inst_binary = "111"
            c_inst_binary += c.comp(p.comp)
            c_inst_binary += c.dest(p.dest)
            c_inst_binary += c.jump(p.jump)
            output.append(c_inst_binary)

        # 111 001110101000
        if len(output[-1]) != 16:
            pass
    return output


if __name__ == "__main__":
    from rich import print

    prefix = "dev/asset/"
    # hack_file = "Add.asm"
    # hack_file = "Max.asm"
    # hack_file = "Rect.asm"
    hack_file = "Pong.asm"
    out = main(file_path=prefix + hack_file)
    # print(out)
    comp_filename = prefix + hack_file.replace(".asm", ".hack")
    with open(comp_filename, "w") as out_f:
        out_f.write("\n".join(out))
