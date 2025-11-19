abstract class GardenTree {
    String shouldTransplant();
}

class AppleTree implements GardenTree {
    final int treeNumber;
    final int age;
    final bool isFruiting;

    static int _counter = 0;

    AppleTree(this.age, this.isFruiting) : treeNumber = ++_counter;

    @override
    String shouldTransplant() {
        if (age > 10 && !isFruiting) {
            return 'Яблуня №$treeNumber потребує пересадки';
        }

        return 'Яблуня №$treeNumber не потребує пересадки';
    }
}

class CherryTree implements GardenTree {
    final int treeNumber;
    final int age;
    final bool isFruiting;

    static int _counter = 0;

    CherryTree(this.age, this.isFruiting) : treeNumber = ++_counter;

    @override
    String shouldTransplant() {
        if (age > 8 && !isFruiting) {
            return 'Вишня №$treeNumber потребує пересадки';
        }

        return 'Вишня №$treeNumber не потребує пересадки';
    }
}

class PearTree implements GardenTree {
    final int treeNumber;
    final int age;
    final bool isFruiting;

    static int _counter = 0;

    PearTree(this.age, this.isFruiting) : treeNumber = ++_counter;

    @override
    String shouldTransplant() {
        if (age > 12 && !isFruiting) {
            return 'Груша №$treeNumber потребує пересадки';
        }
        
        return 'Груша №$treeNumber не потребує пересадки';
    }
}

void main() {
    var appleTree = AppleTree(11, false);
    var appleTree2 = AppleTree(5, true);
    var cherryTree = CherryTree(7, true);
    var cherryTree2 = CherryTree(9, false);
    var pearTree = PearTree(13, false);
    var pearTree2 = PearTree(10, true);

    print(appleTree.shouldTransplant());
    print(appleTree2.shouldTransplant());
    print(cherryTree.shouldTransplant());
    print(cherryTree2.shouldTransplant());
    print(pearTree.shouldTransplant());
    print(pearTree2.shouldTransplant());
}