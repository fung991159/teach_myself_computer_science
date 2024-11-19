# Construct a class hierarchy for different types of computers.


class Computer:
    def __init__(self, cpu_speed, ram_capacity, disk_storage_capacity):
        self.cpu_speed = cpu_speed
        self.ram_capacity = ram_capacity
        self.disk_storage_capacity = disk_storage_capacity


class Desktop(Computer):
    def __init__(
        self, cpu_speed, ram_capacity, disk_storage_capacity, number_of_monitors
    ):
        super.__init__(self, cpu_speed, ram_capacity, disk_storage_capacity)

        self.number_of_monitors = number_of_monitors


class Laptop(Computer):
    def __init__(self, cpu_speed, ram_capacity, disk_storage_capacity, battery_size):
        super.__init__(self, cpu_speed, ram_capacity, disk_storage_capacity)

        self.battery_size = battery_size
