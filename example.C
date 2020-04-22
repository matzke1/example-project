#include <rose/rose.h>
#include <rose/Partitioner2/Engine.h>

int main(int argc, char *argv[]) {
    ROSE_INITIALIZE;                                    // see Rose::initialize

    // Parse the command line, accumulating switches into the engine and returning the remaining positional command-line
    // arguments.
    std::string purpose = "disassembles a binary specimen";
    std::string description =
        "This tool disassembles the specified file and presents the results "
        "as a pseudo assembly listing, a listing intended for human consumption "
        "rather than assembling.  This implementation serves as the \"Hello, "
        "World!\" example for binary analysis, so let's keep it simple!";
    Rose::BinaryAnalysis::Partitioner2::Engine engine;
    std::vector<std::string> args = engine.parseCommandLine(argc, argv, purpose, description).unreachedArgs();

    // Disassemble the specimen.
    Rose::BinaryAnalysis::Partitioner2::Partitioner partitioner = engine.partition(args);

    // Generate an assembly listing.
    partitioner.unparse(std::cout);
}
