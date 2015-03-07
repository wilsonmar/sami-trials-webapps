import sbt._
import Keys._
import play.Project._


object ApplicationBuild extends Build {

  val appName         = "TrialsAdmin"
  val appVersion      = "1.0-SNAPSHOT"
  val assetsLoader    = "com.ee" %% "assets-loader" % "0.12.3"


  val appDependencies = Seq(
    // Add your project dependencies here,
    javaCore,
    javaJdbc,
    javaEbean
  )

  lazy val main = play.Project(appName, appVersion, appDependencies)

}





