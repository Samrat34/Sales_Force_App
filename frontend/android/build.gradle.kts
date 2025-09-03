import org.gradle.api.tasks.Delete
import org.gradle.api.file.Directory

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// Define a new root build directory outside the project
val newRootBuildDir: Directory = rootProject.layout.buildDirectory
    .dir("../../build")
    .get()
rootProject.layout.buildDirectory.set(newRootBuildDir)

// Configure subprojects to use their own build directories
subprojects {
    val newSubprojectBuildDir: Directory = newRootBuildDir.dir(project.name)
    project.layout.buildDirectory.set(newSubprojectBuildDir)
}

// Ensure app project is evaluated first (optional, if needed)
subprojects {
    project.evaluationDependsOn(":app")
}

// Register a clean task to delete the new root build directory
tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}