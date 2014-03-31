<?xml version="1.0" encoding="UTF-16"?>
<!DOCTYPE BlockLangDef SYSTEM "lang_def.dtd">

<!-- 


This describes every BlockGenus, BlockDrawer, BlockFamilies in Starlogo-TNG.

Note: For BlockGenus, if genus A relies on another genus B, that genus B must be 
specified in the xml file before genus A is specified.  We impose this requirement so 
that sanity checks can be made regarding the validity of a default argument when the
BlockGenuses are first loaded. 

IMPORTANT: recvd-data: change type from string to character. (need to introduce a whole new shape?)
variable declaration and assignment blocks
-->

<BlockLangDef>

	<BlockConnectorShapes>
		<BlockConnectorShape shape-type="number" shape-number="1"></BlockConnectorShape>
		<BlockConnectorShape shape-type="number-list" shape-number="2"></BlockConnectorShape>
		<BlockConnectorShape shape-type="number-inv" shape-number="3"></BlockConnectorShape>
		<BlockConnectorShape shape-type="boolean" shape-number="4"></BlockConnectorShape>
		<BlockConnectorShape shape-type="boolean-list" shape-number="5"></BlockConnectorShape>
		<BlockConnectorShape shape-type="boolean-inv" shape-number="6"></BlockConnectorShape>
		<BlockConnectorShape shape-type="string" shape-number="7"></BlockConnectorShape>
		<BlockConnectorShape shape-type="string-list" shape-number="8"></BlockConnectorShape>
		<BlockConnectorShape shape-type="string-inv" shape-number="9"></BlockConnectorShape>
		<BlockConnectorShape shape-type="poly" shape-number="10"></BlockConnectorShape>
		<BlockConnectorShape shape-type="poly-list" shape-number="11"></BlockConnectorShape>
		<BlockConnectorShape shape-type="poly-inv" shape-number="12"></BlockConnectorShape>
		<BlockConnectorShape shape-type="proc-param" shape-number="13"></BlockConnectorShape>
		<BlockConnectorShape shape-type="cmd" shape-number="14"></BlockConnectorShape>
	</BlockConnectorShapes>
	
	<BlockGenuses>
		<!-- Stub Genuses 
			Do not remove unless you would like to remove the stub feature all together
		-->
		
		<BlockGenus name="getter" kind="data" initlabel="" color="0 0 0" >
			<description>
				<text>
					Reports the value of the variable.
				</text>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="plug" connector-type="poly" position-type="mirror"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="is-monitorable" value="yes"></LangSpecProperty>
			</LangSpecProperties>	
		</BlockGenus>
		
		<BlockGenus name="setter" kind="command" initlabel="" color="0 0 0" label-prefix="set ">
			<description>
				<text>
					Sets the value of the variable.
				</text>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="socket" connector-type="poly" position-type="single"></BlockConnector>
			</BlockConnectors>
		</BlockGenus>
		
		<BlockGenus name="caller" kind="command" initlabel="" color="0 0 0">
			<description>
				<text>
					Calls the procedure of the specified name.
				</text>
			</description>
		</BlockGenus>

		<BlockGenus name="inc" kind="command" initlabel="" color="0 0 0" label-prefix="inc ">
			<description>
				<text>
					Increments the value of the variable number.
				</text>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="socket" connector-type="number" position-type="single"></BlockConnector>
			</BlockConnectors>		
		</BlockGenus>
		
		<!-- End of Stub Genuses -->
	
		<BlockGenus name="number" kind="data" initlabel="1" editable-label="yes" is-label-value="yes" color="255 0 255">
			<description>
				<text>
					Reports the number shown.
				</text>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="plug" connector-type="number" position-type="mirror"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="eval-num"></LangSpecProperty>
				<LangSpecProperty key="is-monitorable" value="yes"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="string" kind="data" initlabel="abc" editable-label="yes" is-label-value="yes" color="255 0 255">
			<description>
				<text>
					Reports the text shown.
				</text>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="plug" connector-type="string" position-type="mirror"></BlockConnector>		
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="eval-num"></LangSpecProperty>
				<LangSpecProperty key="is-monitorable" value="yes"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
                
                <BlockGenus name="strvariable" kind="data" initlabel="abc" editable-label="yes" is-label-value="yes" color="255 0 255">
			<description>
				<text>
					Reports the text shown.
				</text>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="plug" connector-type="string" position-type="mirror"></BlockConnector>		
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="eval-num"></LangSpecProperty>
				<LangSpecProperty key="is-monitorable" value="yes"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
                <BlockGenus name="numvariable" kind="data" initlabel="a" editable-label="yes" is-label-value="yes" color="255 0 255">
			<description>
				<text>
					Reports the text shown.
				</text>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="plug" connector-type="number" position-type="mirror"></BlockConnector>		
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="eval-num"></LangSpecProperty>
				<LangSpecProperty key="is-monitorable" value="yes"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
                
                
		<BlockGenus name="true" kind="data" initlabel="true" color="255 0 255">
			<description>
				<text>
					Reports the boolean true.
				</text>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="plug" connector-type="boolean" position-type="mirror"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="true"></LangSpecProperty>
				<LangSpecProperty key="is-monitorable" value="yes"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
                
		<BlockGenus name="false" kind="data" initlabel="false" color="255 0 255">
			<description>
				<text>
					Reports the boolean false.
				</text>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="plug" connector-type="boolean" position-type="mirror"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="false"></LangSpecProperty>
				<LangSpecProperty key="is-monitorable" value="yes"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		
                
                
                <BlockGenus name="up" kind="command" initlabel="upward" color="255 0 0">
			<description>
				<text>
					Robot moves upward with speed <arg n="1"/>
				</text>
				<arg-description n="1" name="steps">
					Speed of the motor
				</arg-description>
			</description>
			<BlockConnectors>
				<BlockConnector label="steps" connector-kind="socket" connector-type="number">
					<DefaultArg genus-name="number" label="1"></DefaultArg>
				</BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="up"></LangSpecProperty>
				<LangSpecProperty key="stack-type" value="breed"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
	
		<BlockGenus name="fd" kind="command" initlabel="forward" color="255 0 0">
			<description>
				<text>
					Robot moves forward with speed <arg n="1"/>
				</text>
				<arg-description n="1" name="steps">
					Speed of the motor
				</arg-description>
			</description>
			<BlockConnectors>
				<BlockConnector label="steps" connector-kind="socket" connector-type="number">
					<DefaultArg genus-name="number" label="1"></DefaultArg>
				</BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="fd"></LangSpecProperty>
				<LangSpecProperty key="stack-type" value="breed"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="buzzer" kind="command" initlabel="buzzer" color="255 0 0">
			<description>
				<text>
					Puts buzzer on for <arg n="1"/> milliseconds
				</text>
				<arg-description n="1" name="steps">
					Buzzer on
				</arg-description>
			</description>
			<BlockConnectors>
				<BlockConnector label="steps" connector-kind="socket" connector-type="number">
					<DefaultArg genus-name="number" label="1"></DefaultArg>
				</BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="buzzer"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="right-fd" kind="command" initlabel="right motor forward" color="255 0 0">
			<description>
				<text>
					Robot moves forward with speed <arg n="1"/>
				</text>
				<arg-description n="1" name="steps">
					Speed of the motor
				</arg-description>
			</description>
			<BlockConnectors>
				<BlockConnector label="steps" connector-kind="socket" connector-type="number">
					<DefaultArg genus-name="number" label="1"></DefaultArg>
				</BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="right-fd"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="left-fd" kind="command" initlabel="left motor forward" color="255 0 0">
			<description>
				<text>
					Robot moves forward with speed <arg n="1"/>
				</text>
				<arg-description n="1" name="steps">
					Speed of the motor
				</arg-description>
			</description>
			<BlockConnectors>
				<BlockConnector label="steps" connector-kind="socket" connector-type="number">
					<DefaultArg genus-name="number" label="1"></DefaultArg>
				</BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="left-fd"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
	
	
		
	    <BlockGenus name="bk" kind="command" initlabel="back" color="255 0 0">
			<description>
				<text>
					Robot moves backward with speed <arg n="1"/>
				</text>
				<arg-description n="1" name="steps">
					Speed of the robot
				</arg-description>
			</description>
			<BlockConnectors>
				<BlockConnector label="steps" connector-kind="socket" connector-type="number">
					<DefaultArg genus-name="number" label="1"></DefaultArg>
				</BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="bk"></LangSpecProperty>
				<LangSpecProperty key="stack-type" value="breed"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		
		<!-- LOGIC -->
		
		<BlockGenus name="if" kind="command" initlabel="if" color="255 80 0">
			<description>
				<text>
					If <arg n="1"/> is true, the agent will run the blocks attached to <arg n="2"/>
				</text>
				<arg-description n="1" name="test">
					The condition being tested.
				</arg-description>
				
				<arg-description n="2" name="then">
					The set of instructions that is done when the condition is true.
				</arg-description>
			</description>
			<BlockConnectors>
				<BlockConnector label="test" connector-kind="socket" connector-type="boolean"></BlockConnector>
				<BlockConnector label="then" connector-kind="socket" connector-type="cmd"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="if"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="ifelse" kind="command" initlabel="ifelse" color="255 80 0">
			<description>
				<text>
					Does the first set of commands if the condition specified is true, otherwise it will do the second set of commands.
				</text>
				<arg-description n="1" name="test">
					The condition being tested.
				</arg-description>
				
				<arg-description n="2" name="then">
					The set of instructions that is done when the condition is true.
				</arg-description>
				
				<arg-description n="3" name="else">
					The set of instructions that is done when the condition is false.
				</arg-description>
			</description>
			<BlockConnectors>
				<BlockConnector label="test" connector-kind="socket" connector-type="boolean"></BlockConnector>
				<BlockConnector label="then" connector-kind="socket" connector-type="cmd"></BlockConnector>
				<BlockConnector label="else" connector-kind="socket" connector-type="cmd"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="ifelse"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="repeat" kind="command" initlabel="repeat" color="255 80 0">
			<description>
				<text>
					Repeats some commands <arg n="1"/> times.
				</text>
				<arg-description n="1" name="times">
					The number of times to repeat the command.
				</arg-description>
				
				<arg-description n="2" name="do">
					The commands to do.
				</arg-description>
			</description>
			<BlockConnectors>
				<BlockConnector label="times" connector-kind="socket" connector-type="number"></BlockConnector>
				<BlockConnector label="do" connector-kind="socket" connector-type="cmd"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="repeat"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
			
			
		<BlockGenus name="or" kind="function" initlabel="or" color="15 20 220">
			<description>
				<text>
					Reports true if one or both of the two conditions are true.
				</text>
				<arg-description n="2" doc-name="condition 1">
					The first condition that must be true.
				</arg-description>
				<arg-description n="3" doc-name="condition 2">
					The second condition that must be true.
				</arg-description>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="plug" connector-type="boolean" position-type="mirror"></BlockConnector>
				<BlockConnector label="" connector-kind="socket" connector-type="boolean" position-type="bottom"></BlockConnector>
				<BlockConnector label="" connector-kind="socket" connector-type="boolean" position-type="bottom"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="or"></LangSpecProperty>
				<LangSpecProperty key="is-monitorable" value="yes"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="and" kind="function" initlabel="and" color="15 20 220">
			<description>
				<text>
					Reports true if both of the conditions are true.
				</text>
				<arg-description n="2" doc-name="condition 1">
					The first condition that must be true.
				</arg-description>
					<arg-description n="3" doc-name="condition 2">
					The second condition that must be true.
				</arg-description>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="plug" connector-type="boolean" position-type="mirror"></BlockConnector>
				<BlockConnector label="" connector-kind="socket" connector-type="boolean" position-type="bottom"></BlockConnector>
				<BlockConnector label="" connector-kind="socket" connector-type="boolean" position-type="bottom"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="and"></LangSpecProperty>
				<LangSpecProperty key="is-monitorable" value="yes"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="not" kind="function" initlabel="not" color="15 20 220">
			<description>
				<text>
					Reports the opposite of <arg n="1"/>.
				</text>
				<arg-description n="1" doc-name="boolean">
					The boolean (<em>true</em> or <em>false</em>) that should be inverted.
				</arg-description>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="plug" connector-type="boolean"></BlockConnector>
				<BlockConnector label="" connector-kind="socket" connector-type="boolean"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="not"></LangSpecProperty>
				<LangSpecProperty key="is-monitorable" value="yes"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>

		
		<BlockGenus name="count-everyone-with" kind="function" initlabel="count everyone with" color="255 0 255">
			<description>
				<text>
					Counts all agents that satisfy a certain condition.
				</text>
				<arg-description n="1" name="condition" doc-name="condition">
					The condition an agent must satisfy to be counted
				</arg-description>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="plug" connector-type="number"></BlockConnector>
				<BlockConnector connector-kind="socket" connector-type="boolean"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="count-everyone-with"></LangSpecProperty>
				<LangSpecProperty key="inline-arg" value="0"></LangSpecProperty>
				<LangSpecProperty key="inline-stack-type" value="breed"></LangSpecProperty>
				<LangSpecProperty key="is-monitorable" value="yes"></LangSpecProperty>
				<LangSpecProperty key="ask-arg" value="0"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="count-everyone" kind="function" initlabel="count everyone" color="255 0 255">
			<description>
				<text>
					Reports the number of agents that are currently alive.
				</text>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="plug" position-type="mirror" connector-type="number"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="count-everyone"></LangSpecProperty>
				<LangSpecProperty key="inline-arg" value="0"></LangSpecProperty>
				<LangSpecProperty key="is-monitorable" value="yes"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<!-- String Functions or Commands -->
		
		<BlockGenus name="say" kind="command" initlabel="say" color="45 201 255">
			<description>
				<text>
					Causes this agent to "say" the supplied text by popping up a speech bubble in SpaceLand.
				</text>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="socket" connector-type="poly"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="say"></LangSpecProperty>
				<LangSpecProperty key="stack-type" value="breed"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="set-status" kind="command" initlabel="set status" color="45 201 255">
			<description>
				<text>
					Displays the text attached to this block in the bottom panel of Spaceland.  
				</text>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="socket" connector-type="string"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="set-status"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="play" kind="command" initlabel="play sound" color="150 255 107">
			<description>
				<text>
					Causes agent to play a sound with the following <arg n="1"/>.  Select a sound from the Sounds drawer and attach to this block.  
				</text>
				<arg-description n="1" name="name">
					The text name of the sound to play.
				</arg-description>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="socket" connector-type="string"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="play"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>	
		
		<BlockGenus name="to-string" kind="function" initlabel="to text" color="45 201 255">
			<description>
				<text>
					Returns a text representation of the given block(s) connected to this.
				</text>
			</description>
			<BlockConnectors>
				<BlockConnector label="" connector-kind="plug" connector-type="string"></BlockConnector>
				<BlockConnector connector-kind="socket" connector-type="poly"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="to-string"></LangSpecProperty>
				<LangSpecProperty key="is-monitorable" value="yes"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>	
		
		<BlockGenus name="string-append" kind="function" initlabel="+" color="45 201 255">
			<description>
				<text>
					Appends <arg n="3"/> to the end of <arg n="2"/>.
				</text>
				<arg-description n="2" doc-name="first">
					The text to which to append <arg n="3"/>.
				</arg-description>
				<arg-description n="3" doc-name="second">
					The text to append to <arg n="2"/>.
				</arg-description>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="plug" connector-type="string" position-type="mirror"></BlockConnector>
				<BlockConnector label="" connector-kind="socket" connector-type="string" position-type="bottom"></BlockConnector>
				<BlockConnector label="" connector-kind="socket" connector-type="string" position-type="bottom"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="sentence"></LangSpecProperty>
				<LangSpecProperty key="is-monitorable" value="yes"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>	
		
	
		<!-- MATH -->
		
		<BlockGenus name="pi" kind="function" initlabel="π" color="255 0 255">
			<description>
				<text>
					Reports the value of PI (approximately 3.14).
				</text>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="plug" connector-type="number" position-type="mirror"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="pi"></LangSpecProperty>
				<LangSpecProperty key="is-monitorable" value="yes"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="e" kind="function" initlabel="e" color="255 0 255">
			<description>
				<text>
					Reports the mathematical number <em>e</em>, which is about 2.718.
				</text>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="plug" connector-type="number" position-type="mirror"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="e"></LangSpecProperty>
				<LangSpecProperty key="is-monitorable" value="yes"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="sum" kind="function" initlabel="+" color="15 20 220">
			<description>
				<text>
					Reports the sum of two numbers (<arg n="1"/> + <arg n="2"/>).
				</text>
				<arg-description n="1" doc-name="left number">
				</arg-description>
				<arg-description n="2" doc-name="right number">
				</arg-description>
			</description>
			<BlockConnectors>
				<BlockConnector label="" connector-kind="plug" connector-type="number" position-type="mirror"></BlockConnector>
				<BlockConnector label="" connector-kind="socket" connector-type="number" position-type="bottom"></BlockConnector>
				<BlockConnector label="" connector-kind="socket" connector-type="number" position-type="bottom"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="sum"></LangSpecProperty>
				<LangSpecProperty key="is-monitorable" value="yes"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="difference" kind="function" initlabel="-" color="15 20 220">
			<description>
				<text>
					Reports the difference of two numbers (<arg n="1"/> - <arg n="2"/>).
				</text>
				<arg-description n="1" doc-name="left number">
				</arg-description>
				<arg-description n="2" doc-name="right number">
				</arg-description>
			</description>
			<BlockConnectors>
				<BlockConnector label="" connector-kind="plug" connector-type="number" position-type="mirror"></BlockConnector>
				<BlockConnector label="" connector-kind="socket" connector-type="number" position-type="bottom"></BlockConnector>
				<BlockConnector label="" connector-kind="socket" connector-type="number" position-type="bottom"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="difference"></LangSpecProperty>
				<LangSpecProperty key="is-monitorable" value="yes"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="product" kind="function" initlabel="x" color="15 20 220">
			<description>
				<text>
					Reports the product of  two numbers (<arg n="1"/> x <arg n="2"/>).
				</text>
				<arg-description n="1" doc-name="left value">
				</arg-description>
				<arg-description n="2" doc-name="right value">
				</arg-description>
			</description>
			<BlockConnectors>
				<BlockConnector label="" connector-kind="plug" connector-type="number" position-type="mirror"></BlockConnector>
				<BlockConnector label="" connector-kind="socket" connector-type="number" position-type="bottom"></BlockConnector>
				<BlockConnector label="" connector-kind="socket" connector-type="number" position-type="bottom"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="product"></LangSpecProperty>
				<LangSpecProperty key="is-monitorable" value="yes"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="quotient" kind="function" initlabel="÷" color="15 20 220">
			<description>
				<text>
					Reports the quotient of  two numbers (<arg n="1"/> ÷ <arg n="2"/>).
				</text>
				<arg-description n="1" doc-name="left value">
				</arg-description>
				<arg-description n="2" doc-name="right value">
				</arg-description>
			</description>
			<BlockConnectors>
				<BlockConnector label="" connector-kind="plug" connector-type="number" position-type="mirror"></BlockConnector>
				<BlockConnector label="" connector-kind="socket" connector-type="number" position-type="bottom"></BlockConnector>
				<BlockConnector label="" connector-kind="socket" connector-type="number" position-type="bottom"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="quotient"></LangSpecProperty>
				<LangSpecProperty key="is-monitorable" value="yes"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="equals" kind="function" initlabel="=" color="15 20 220">
			<description>
				<text>
					Determines if two quantities are equal (<arg n="1"/> = <arg n="2"/>).
				</text>
				<arg-description n="1" doc-name="left value">
				</arg-description>
				<arg-description n="2" doc-name="right value">
				</arg-description>
			</description>
			<BlockConnectors>
				<BlockConnector label="" connector-kind="plug" connector-type="boolean" position-type="mirror"></BlockConnector>
				<BlockConnector label="" connector-kind="socket" connector-type="poly" position-type="bottom"></BlockConnector>
				<BlockConnector label="" connector-kind="socket" connector-type="poly" position-type="bottom"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="equals"></LangSpecProperty>
				<LangSpecProperty key="is-monitorable" value="yes"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
                <BlockGenus name="strequals" kind="function" initlabel="=" color="15 20 220">
			<description>
				<text>
					Determines if two strings are equal (<arg n="1"/> = <arg n="2"/>).
				</text>
				<arg-description n="1" doc-name="left value">
				</arg-description>
				<arg-description n="2" doc-name="right value">
				</arg-description>
			</description>
			<BlockConnectors>
				<BlockConnector label="" connector-kind="plug" connector-type="boolean" position-type="mirror"></BlockConnector>
				<BlockConnector label="" connector-kind="socket" connector-type="string" position-type="bottom"></BlockConnector>
				<BlockConnector label="" connector-kind="socket" connector-type="string" position-type="bottom"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="strequals"></LangSpecProperty>
				<LangSpecProperty key="is-monitorable" value="yes"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
                
                
                <BlockGenus name="numequals" kind="function" initlabel="=" color="15 20 220">
			<description>
				<text>
					Determines if two numerical quantities are equal (<arg n="1"/> = <arg n="2"/>).
				</text>
				<arg-description n="1" doc-name="left value">
				</arg-description>
				<arg-description n="2" doc-name="right value">
				</arg-description>
			</description>
			<BlockConnectors>
				<BlockConnector label="" connector-kind="plug" connector-type="boolean" position-type="mirror"></BlockConnector>
				<BlockConnector label="" connector-kind="socket" connector-type="number" position-type="bottom"></BlockConnector>
				<BlockConnector label="" connector-kind="socket" connector-type="number" position-type="bottom"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="numequals"></LangSpecProperty>
				<LangSpecProperty key="is-monitorable" value="yes"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
                
                
		<BlockGenus name="not-equals" kind="function" initlabel="≠" color="15 20 220">
			<description>
				<text>
					Determines if two quantities are different (<arg n="1"/> != <arg n="2"/>).
				</text>
				<arg-description n="1" doc-name="left value">
				The first thing to compare.
				</arg-description>
				<arg-description n="2" doc-name="right value">
				The second thing to compare.
				</arg-description>
			</description>
			<BlockConnectors>
				<BlockConnector label="" connector-kind="plug" connector-type="boolean" position-type="mirror"></BlockConnector>
				<BlockConnector label="" connector-kind="socket" connector-type="poly" position-type="bottom"></BlockConnector>
				<BlockConnector label="" connector-kind="socket" connector-type="poly" position-type="bottom"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="not-equals"></LangSpecProperty>
				<LangSpecProperty key="is-monitorable" value="yes"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="lessthan" kind="function" initlabel="&lt;" color="15 20 220">
			<description>
				<text>
					Reports whether the <arg n="1"/> is less than the <arg n="2"/>.
				</text>
				<arg-description n="1" doc-name="left value">
				The first thing to compare.
				</arg-description>
				<arg-description n="2" doc-name="right value">
				The second thing to compare.
				</arg-description>
			</description>
			<BlockConnectors>
				<BlockConnector label="" connector-kind="plug" connector-type="boolean" position-type="mirror"></BlockConnector>
				<BlockConnector label="" connector-kind="socket" connector-type="number" position-type="bottom"></BlockConnector>
				<BlockConnector label="" connector-kind="socket" connector-type="number" position-type="bottom"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="less-than"></LangSpecProperty>
				<LangSpecProperty key="is-monitorable" value="yes"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="lessthanorequalto" kind="function" initlabel="≤" color="15 20 220">
			<description>
				<text>
					Reports whether the <arg n="1"/> is less than or equal to the <arg n="2"/>.
				</text>
				<arg-description n="1" doc-name="left value">
				The first thing to compare.
				</arg-description>
				<arg-description n="2" doc-name="right value">
				The second thing to compare.
				</arg-description>
			</description>
			<BlockConnectors>
				<BlockConnector label="" connector-kind="plug" connector-type="boolean" position-type="mirror"></BlockConnector>
				<BlockConnector label="" connector-kind="socket" connector-type="number" position-type="bottom"></BlockConnector>
				<BlockConnector label="" connector-kind="socket" connector-type="number" position-type="bottom"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="less-than-or-equal-to"></LangSpecProperty>
				<LangSpecProperty key="is-monitorable" value="yes"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="greaterthan" kind="function" initlabel="&gt;" color="15 20 220">
			<description>
				<text>
					Reports whether the <arg n="1"/> is greater than the <arg n="2"/>.
				</text>
				<arg-description n="1" doc-name="left value">
				The first thing to compare.
				</arg-description>
				<arg-description n="2" doc-name="right value">
				The second thing to compare.
				</arg-description>
			</description>
			<BlockConnectors>
				<BlockConnector label="" connector-kind="plug" connector-type="boolean" position-type="mirror"></BlockConnector>
				<BlockConnector label="" connector-kind="socket" connector-type="number" position-type="bottom"></BlockConnector>
				<BlockConnector label="" connector-kind="socket" connector-type="number" position-type="bottom"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="greater-than"></LangSpecProperty>
				<LangSpecProperty key="is-monitorable" value="yes"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="greaterthanorequalto" kind="function" initlabel="≥" color="15 20 220">
			<description>
				<text>
					Reports whether the <arg n="1"/> is greater than or equal to the <arg n="2"/>.
				</text>
				<arg-description n="1" doc-name="left value">
				The first thing to compare.
				</arg-description>
				<arg-description n="2" doc-name="right value">
				The second thing to compare.
				</arg-description>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="plug" connector-type="boolean" position-type="mirror"></BlockConnector>
				<BlockConnector connector-kind="socket" connector-type="number" position-type="bottom"></BlockConnector>
				<BlockConnector connector-kind="socket" connector-type="number" position-type="bottom"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="greater-than-or-equal-to"></LangSpecProperty>
				<LangSpecProperty key="is-monitorable" value="yes"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="atan" kind="function" initlabel="atan" color="15 20 220">
			<BlockConnectors>
				<BlockConnector connector-kind="plug" connector-type="number"></BlockConnector>
				<BlockConnector label="x" connector-kind="socket" connector-type="number"></BlockConnector>
				<BlockConnector label="y" connector-kind="socket" connector-type="number"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="atan"></LangSpecProperty>
				<LangSpecProperty key="is-monitorable" value="yes"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="random" kind="function" initlabel="random" color="15 20 220">
			<description>
				<text>
					Reports a random integer greater than or equal to 1 and less than or equal to <arg n="1"/>.
				</text>
				<arg-description n="1" doc-name="number">
					The upper integer in the range.
				</arg-description>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="plug" connector-type="number"></BlockConnector>
				<BlockConnector connector-kind="socket" connector-type="number">
					<DefaultArg genus-name="number" label="10" />
				</BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="random"></LangSpecProperty>
				<LangSpecProperty key="is-monitorable" value="yes"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="round" kind="function" initlabel="round" color="15 20 220">
			<description>
				<text>
					Rounds <arg n="1"/> to the nearest integer.
				</text>
				<arg-description n="1" doc-name="number">
					The number to round.
				</arg-description>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="plug" connector-type="number"></BlockConnector>
				<BlockConnector connector-kind="socket" connector-type="number"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="round"></LangSpecProperty>
				<LangSpecProperty key="is-monitorable" value="yes"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="int" kind="function" initlabel="int" color="15 20 220">
			<description>
				<text>
					Reports the whole number part of the number.
				</text>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="plug" connector-type="number"></BlockConnector>
				<BlockConnector connector-kind="socket" connector-type="number"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="int"></LangSpecProperty>
				<LangSpecProperty key="is-monitorable" value="yes"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="remainder" kind="function" initlabel="remainder" color="15 20 220">
			<description>
				<text>
					Reports the integer remainder of <arg n="2"/> divided by <arg n="3"/>.
				</text>
				<arg-description n="2" doc-name="first">
					The number to divide.
				</arg-description>
				
				<arg-description n="3" doc-name="second">
					The number by which to divide.
				</arg-description>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="plug" connector-type="number" position-type="mirror"></BlockConnector>
				<BlockConnector connector-kind="socket" connector-type="number" position-type="bottom"></BlockConnector>
				<BlockConnector connector-kind="socket" connector-type="number" position-type="bottom"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="remainder"></LangSpecProperty>
				<LangSpecProperty key="is-monitorable" value="yes"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="min" kind="function" initlabel="min" color="15 20 220">
			<description>
				<text>
					Reports the smaller value of the two numbers.	
				</text>
				<arg-description n="2" doc-name="number 1">
					The first number to compare.
				</arg-description>
				<arg-description n="3" doc-name="number 2">
					The second number to compare.
				</arg-description>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="plug" connector-type="number" position-type="mirror"></BlockConnector>
				<BlockConnector connector-kind="socket" connector-type="number" position-type="bottom"></BlockConnector>
				<BlockConnector connector-kind="socket" connector-type="number" position-type="bottom"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="min"></LangSpecProperty>
				<LangSpecProperty key="is-monitorable" value="yes"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="max" kind="function" initlabel="max" color="15 20 220">
			<description>
				<text>
					Reports the greatest value of the two numbers.	
				</text>
				<arg-description n="2" doc-name="number 1">
					The first number to compare.
				</arg-description>
				<arg-description n="3" doc-name="number 2">
					The second number to compare.
				</arg-description>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="plug" connector-type="number" position-type="mirror"></BlockConnector>
				<BlockConnector connector-kind="socket" connector-type="number" position-type="bottom"></BlockConnector>
				<BlockConnector connector-kind="socket" connector-type="number" position-type="bottom"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="max"></LangSpecProperty>
				<LangSpecProperty key="is-monitorable" value="yes"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="power" kind="function" initlabel="power" color="15 20 220">
			<description>
				<text>
					Reports the power of one number raised to another (<arg n="1"/> ^ <arg n="2"/>).
				</text>
				<arg-description n="1" doc-name="base">
				</arg-description>
				<arg-description n="2" doc-name="exponent">
				</arg-description>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="plug" connector-type="number" position-type="mirror"></BlockConnector>
				<BlockConnector connector-kind="socket" connector-type="number" position-type="bottom"></BlockConnector>
				<BlockConnector connector-kind="socket" connector-type="number" position-type="bottom"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="power"></LangSpecProperty>
				<LangSpecProperty key="is-monitorable" value="yes"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="abs" kind="function" initlabel="abs" color="15 20 220">
			<description>
				<text>
				Reports the absolute value of a number.
				</text>
				<arg-description n="1" doc-name="number">
					A number from which to get the absolute value.
				</arg-description>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="plug" connector-type="number"></BlockConnector>
				<BlockConnector connector-kind="socket" connector-type="number"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="abs"></LangSpecProperty>
				<LangSpecProperty key="is-monitorable" value="yes"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="sqrt" kind="function" initlabel="sqrt" color="15 20 220">
			<description>
				<text>
					Reports the square root of <arg n="1"/>.
				</text>
				<arg-description n="1" doc-name="number">
					The number whose square root to take.
				</arg-description>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="plug" connector-type="number"></BlockConnector>
				<BlockConnector connector-kind="socket" connector-type="number"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="sqrt"></LangSpecProperty>
				<LangSpecProperty key="is-monitorable" value="yes"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="sin" kind="function" initlabel="sin" color="15 20 220">
			<description>
				<text>
					A Trigonmetric function that reports the sine of the specified angle. 
				</text>
				<arg-description n="1" name="degs">
					The angle in degrees for which the sine will be reported.
				</arg-description>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="plug" connector-type="number"></BlockConnector>
				<BlockConnector label="degs" connector-kind="socket" connector-type="number"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="sin"></LangSpecProperty>
				<LangSpecProperty key="is-monitorable" value="yes"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="cos" kind="function" initlabel="cos" color="15 20 220">
			<description>
				<text>
					A Trigonmetric function that reports the cosine of the specified angle. 
				</text>
				<arg-description n="1" name="degs">
					The angle in degrees for which the cosine will be reported.
				</arg-description>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="plug" connector-type="number"></BlockConnector>
				<BlockConnector label="degs" connector-kind="socket" connector-type="number"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="cos"></LangSpecProperty>
				<LangSpecProperty key="is-monitorable" value="yes"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="tan" kind="function" initlabel="tan" color="15 20 220">
			<description>
				<text>
					A Trigonmetric function that reports the tangent of the specified angle. 
				</text>
				<arg-description n="1" name="degs">
					The angle in degrees for which the tangent will be reported.
				</arg-description>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="plug" connector-type="number"></BlockConnector>
				<BlockConnector label="degs" connector-kind="socket" connector-type="number"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="tan"></LangSpecProperty>
				<LangSpecProperty key="is-monitorable" value="yes"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="asin" kind="function" initlabel="asin" color="15 20 220">
			<description>
				<text>
					Trigonometric function that reports the arcsine of the specified number.  All angles are reported in degrees.
				</text>
				<arg-description n="1" doc-name="number">
					A number from which to get the arcsine.
				</arg-description>
				</description>
			<BlockConnectors>
				<BlockConnector connector-kind="plug" connector-type="number"></BlockConnector>
				<BlockConnector connector-kind="socket" connector-type="number"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="asin"></LangSpecProperty>
				<LangSpecProperty key="is-monitorable" value="yes"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="acos" kind="function" initlabel="acos" color="15 20 220">
			<description>
				<text>
					Trigonometric function that reports the arccosine of the specified number.  All angles are reported in degrees.
				</text>
				<arg-description n="1" doc-name="number">
					A number from which to get the arccosine.
				</arg-description>
				</description>
			<BlockConnectors>
				<BlockConnector connector-kind="plug" connector-type="number"></BlockConnector>
				<BlockConnector connector-kind="socket" connector-type="number"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="acos"></LangSpecProperty>
				<LangSpecProperty key="is-monitorable" value="yes"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="log" kind="function" initlabel="log" color="15 20 220">
			<description>
				<text>
					Reports the logarithm base 10 of <arg n="1"/>. <note>The return value <i>x</i> will be the number for which 10 to the power of <i>x</i> is equal to <arg n="1"/>.</note>
				</text>
				<arg-description n="1" doc-name="number">
					The number of which to take the natural logarithm
				</arg-description>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="plug" connector-type="number"></BlockConnector>
				<BlockConnector connector-kind="socket" connector-type="number"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="log"></LangSpecProperty>
				<LangSpecProperty key="is-monitorable" value="yes"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="ln" kind="function" initlabel="ln" color="15 20 220">
			<description>
				<text>
					Reports the natural logarithm of <arg n="1"/>. <note>The return value <i>x</i> will be the number for which the mathematical constant e, which is about 2.718, to the power of <i>x</i> is equal to <arg n="1"/>.</note>
				</text>
				<arg-description n="1" doc-name="number">
					The number of which to take the natural logarithm
				</arg-description>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="plug" connector-type="number"></BlockConnector>
				<BlockConnector connector-kind="socket" connector-type="number"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="ln"></LangSpecProperty>
				<LangSpecProperty key="is-monitorable" value="yes"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<!-- TERRAIN --> 
				
		<BlockGenus name="pc" kind="function" initlabel="patch color" color="40 255 0">
			<description>
             	<text>Reports the color of the patch where the agent is standing.</text>
            </description>
			<BlockConnectors>
				<BlockConnector connector-kind="plug" connector-type="number" position-type="mirror"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="pc"></LangSpecProperty>
				<LangSpecProperty key="stack-type" value="breed"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="stamp" kind="command" initlabel="stamp" color="0 236 0">
			<description>
             	<text>Changes the color of the patch on which this agent is to <arg n="1"/>.</text>
				<arg-description n="1" name="color">
					The color to which to change the patch.
				</arg-description>
            </description>
			<BlockConnectors>
				<BlockConnector label="color" connector-kind="socket" connector-type="number">
					<DefaultArg genus-name="red" label="red"></DefaultArg>
				</BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="stamp"></LangSpecProperty>
				<LangSpecProperty key="stack-type" value="breed"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="patch-height" kind="function" initlabel="patch height" color="40 255 0">
			<description>
             	 <text>Reports the height of the patch where the agent is standing.</text>
            </description>
			<BlockConnectors>
				<BlockConnector connector-kind="plug" connector-type="number" position-type="mirror"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="patch-height"></LangSpecProperty>
				<LangSpecProperty key="stack-type" value="breed"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		<BlockGenus name="stomp" kind="command" initlabel="stomp" color="0 236 0">
			<description>
             	<text>Decreases the height of the patch where the agent is standing, smoothly connecting the edges to surrounding patches.</text>
				<arg-description n="1" name="height">
					How much the patch height is decreased.
				</arg-description>
            </description>
			<BlockConnectors>
				<BlockConnector label="height" connector-kind="socket" connector-type="number">
					<DefaultArg genus-name="number" label="1"></DefaultArg>
				</BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="stomp"></LangSpecProperty>
				<LangSpecProperty key="stack-type" value="breed"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>

		<BlockGenus name="yank" kind="command" initlabel="yank" color="0 236 0">
			<description>
             	<text>Increases the height of the patch where the agent is standing, smoothly connecting the edges to surrounding patches.</text>
				<arg-description n="1" name="height">
					How much the patch height is increased.
				</arg-description>
            </description>
			<BlockConnectors>
				<BlockConnector label="height" connector-kind="socket" connector-type="number">
					<DefaultArg genus-name="number" label="1"></DefaultArg>
				</BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="yank"></LangSpecProperty>
				<LangSpecProperty key="stack-type" value="breed"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<!-- TRAITS -->
		
		<BlockGenus name="setc" kind="command" initlabel="set color" color="27 180 225">
			<description>
				<text>Sets the color of the agent to the given color.</text>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="socket" connector-type="number">
					<DefaultArg genus-name="red" label="red"></DefaultArg>
				</BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="setc"></LangSpecProperty>
				<LangSpecProperty key="stack-type" value="breed"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="color" kind="function" initlabel="color" color="44 220 255">
			<description>
				<text>Reports the color of this agent.</text>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="plug" connector-type="number" position-type="mirror"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="agent-color"></LangSpecProperty>
				<LangSpecProperty key="stack-type" value="breed"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="seth" kind="command" initlabel="set heading" color="27 180 225">
			<description>
				<text>Sets the heading of this agent to the specified value in degrees.</text>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="socket" connector-type="number">
					<DefaultArg genus-name="number" label="0"></DefaultArg>
				</BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="seth"></LangSpecProperty>
				<LangSpecProperty key="stack-type" value="breed"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>

		<BlockGenus name="heading" kind="function" initlabel="heading" color="44 220 255">
			<description>
				<text>Reports the angle, in degrees, where the agent is heading.</text>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="plug" connector-type="number" position-type="mirror"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="heading"></LangSpecProperty>
				<LangSpecProperty key="stack-type" value="breed"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>

		<BlockGenus name="xcor" kind="function" initlabel="xcor" color="44 220 255">
			<description>
				<text>Reports the x coordinate of this agent.</text>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="plug" connector-type="number" position-type="mirror"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="xcor"></LangSpecProperty>
				<LangSpecProperty key="stack-type" value="breed"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="ycor" kind="function" initlabel="ycor" color="44 220 255">
			<description>
				<text>Reports the y coordinate of this agent.</text>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="plug" connector-type="number" position-type="mirror"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="ycor"></LangSpecProperty>
				<LangSpecProperty key="stack-type" value="breed"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>

		<BlockGenus name="scale" kind="function" initlabel="size" color="44 220 255">
			<description>
				<text>Reports the size, or scale, of this agent.</text>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="plug" connector-type="number" position-type="mirror"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="agent-scale"></LangSpecProperty>
				<LangSpecProperty key="stack-type" value="breed"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>

		<BlockGenus name="setscale" kind="command" initlabel="set size" color="27 180 225">
			<description>
				<text>Sets the size of this agent's shape.</text>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="socket" connector-type="number">
					<DefaultArg genus-name="number" label="1"></DefaultArg>
				</BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="set-scale"></LangSpecProperty>
				<LangSpecProperty key="stack-type" value="breed"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>


		<BlockGenus name="who" kind="function" initlabel="ID" color="44 220 255">
			<description>
				<text>Reports the ID number, or "ID" of this agent.</text>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="plug" connector-type="number" position-type="mirror"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="who"></LangSpecProperty>
				<LangSpecProperty key="stack-type" value="breed"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>

		<BlockGenus name="penup" kind="command" initlabel="pen up" color="27 180 225">
			<description>
				<text>Pulls the agent's pen up so the agent will not stamp every patch where it moves.</text>
			</description>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="pu"></LangSpecProperty>
				<LangSpecProperty key="stack-type" value="breed"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="pendown" kind="command" initlabel="pen down" color="27 180 225">
			<description>
				<text>Pulls the agent's pen down so the agent will stamp every patch where it moves.</text>
			</description>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="pd"></LangSpecProperty>
				<LangSpecProperty key="stack-type" value="breed"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="pendown?" kind="function" initlabel="pen down?" color="44 220 255">
			<description>
				<text>Reports true if this agent's pen is down, and false otherwise.</text>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="plug" connector-type="boolean" position-type="mirror"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="pendown?"></LangSpecProperty>
				<LangSpecProperty key="stack-type" value="breed"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="shape" kind="function" initlabel="shape" color="44 220 255">
			<description>
				<text>Reports the shape of this agent.</text>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="plug" connector-type="string" position-type="mirror"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="shape"></LangSpecProperty>
				<LangSpecProperty key="stack-type" value="breed"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="breed" kind="function" initlabel="breed" color="44 220 255">
			<description>
				<text>Reports the breed of this agent.</text>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="plug" connector-type="string" position-type="mirror"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="breed"></LangSpecProperty>
				<LangSpecProperty key="stack-type" value="breed"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="setshape" kind="command" initlabel="set shape" color="27 180 225">
			<description>
				<text>
					Causes this agent to change its shape to the supplied shape.
				</text>
				<arg-description n="1" name="string" doc-name="string">
					The shape
				</arg-description>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="socket" connector-type="string"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="setshape"></LangSpecProperty>
				<LangSpecProperty key="stack-type" value="breed"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="setbreed" kind="command" initlabel="set breed" color="27 180 225">
			<description>
				<text>
					Causes this agent to change its breed to the supplied breed.
				</text>
				<arg-description n="1" name="string" doc-name="string">
					The name of the new breed.
				</arg-description>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="socket" connector-type="string"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="setbreed"></LangSpecProperty>
				<LangSpecProperty key="stack-type" value="breed"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<!-- CONTROLS -->
		
		<BlockGenus name="keyboard-up" kind="data" initlabel="keyboard up arrow?" color="255 255 0">
			<description>
				<text>
					Reports whether the up arrow key is being pressed. <note>Arrow keys have a drop down menu that allow you to select other arrow keys.</note>
				</text>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="plug" connector-type="boolean" position-type="mirror"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="keyboard-up"></LangSpecProperty>
				<LangSpecProperty key="is-monitorable" value="yes"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="keyboard-down" kind="data" initlabel="keyboard down arrow?" color="255 255 0">
			<description>
				<text>
					Reports whether the down arrow key is being pressed. <note>Arrow keys have a drop down menu that allow you to select other arrow keys.</note>
				</text>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="plug" connector-type="boolean" position-type="mirror"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="keyboard-down"></LangSpecProperty>
				<LangSpecProperty key="is-monitorable" value="yes"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="keyboard-left" kind="data" initlabel="keyboard left arrow?" color="255 255 0">
			<description>
				<text>
					Reports whether the left arrow key is being pressed. <note>Arrow keys have a drop down menu that allow you to select other arrow keys.</note>
				</text>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="plug" connector-type="boolean" position-type="mirror"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="keyboard-left"></LangSpecProperty>
				<LangSpecProperty key="is-monitorable" value="yes"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="keyboard-right" kind="data" initlabel="keyboard right arrow?" color="255 255 0">
			<description>
				<text>
					Reports whether the right arrow key is being pressed. <note>Arrow keys have a drop down menu that allow you to select other arrow keys.</note>
				</text>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="plug" connector-type="boolean" position-type="mirror"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="keyboard-right"></LangSpecProperty>
				<LangSpecProperty key="is-monitorable" value="yes"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="keyboard-space" kind="data" initlabel="keyboard space bar?" color="255 255 0">
			<description>
				<text>
					Reports whether the space bar is being pressed. 
				</text>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="plug" connector-type="boolean" position-type="mirror"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="keyboard-space"></LangSpecProperty>
				<LangSpecProperty key="is-monitorable" value="yes"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="white-line-right" kind="function" initlabel="joy x-axis" color="255 255 0">
			<description>
				<text>
					Reports the current position along the x-axis of the joystick.  Reports -1 at the extreme left position and +1 at the extreme right.
				</text>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="plug" connector-type="number" position-type="mirror"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="white-line-right"></LangSpecProperty>
				<LangSpecProperty key="is-monitorable" value="yes"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>

		<BlockGenus name="joy-yaxis" kind="function" initlabel="joy y-axis" color="255 255 0">
			<description>
				<text>
					Reports the current position along the y-axis of the joystick.  Reports -10 at the extreme left position and +10 at the extreme right.
				</text>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="plug" connector-type="number" position-type="mirror"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="joy-yaxis"></LangSpecProperty>
				<LangSpecProperty key="is-monitorable" value="yes"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="joy-radius" kind="function" initlabel="joy radius" color="255 255 0">
			<description>
				<text>
					Reports the current radius of the position of the joystick.  Reports 0 when the joystick is in the center and 1 when it is full deflected in any direction.
				</text>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="plug" connector-type="number" position-type="mirror"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="joy-radius"></LangSpecProperty>
				<LangSpecProperty key="is-monitorable" value="yes"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="joy-angle" kind="function" initlabel="joy angle" color="255 255 0">
			<description>
				<text>
					Reports the current angle in degrees that the joystick is at, with 0 at the top and 180 at the bottom.
				</text>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="plug" connector-type="number" position-type="mirror"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="joy-angle"></LangSpecProperty>
				<LangSpecProperty key="is-monitorable" value="yes"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		
		<BlockGenus name="white-line-left" kind="function" initlabel="white line left" color="255 255 0">
			<description>
				<text>
					Reports the white line sensor's value
				</text>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="plug" connector-type="number" position-type="mirror"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="joy-angle"></LangSpecProperty>
				<LangSpecProperty key="is-monitorable" value="yes"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>

		<BlockGenus name="white-line-middle" kind="function" initlabel="white line middle" color="255 255 0">
			<description>
				<text>
					Reports the white line sensor's value
				</text>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="plug" connector-type="number" position-type="mirror"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="joy-angle"></LangSpecProperty>
				<LangSpecProperty key="is-monitorable" value="yes"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="white-line-right" kind="function" initlabel="white line right" color="255 255 0">
			<description>
				<text>
					Reports the white line sensor's value
				</text>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="plug" connector-type="number" position-type="mirror"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="joy-angle"></LangSpecProperty>
				<LangSpecProperty key="is-monitorable" value="yes"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="front-IR" kind="function" initlabel="front IR" color="255 255 0">
			<description>
				<text>
					Value of front IR sensor
				</text>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="plug" connector-type="number" position-type="mirror"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="joy-angle"></LangSpecProperty>
				<LangSpecProperty key="is-monitorable" value="yes"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
	

		<!-- Xbee -->
                <BlockGenus name="recvd-data" kind="data" initlabel="Recvd-Data" editable-label="no" label-unique="yes" page-label-enabled="yes" is-starter="no" color="177 10 255">
			<description>
				<text>
					Place-holder for data received through ZigBee wireless module. (character)
				</text>
			</description>
                        <BlockConnectors>
				<BlockConnector connector-kind="plug" connector-type="string" position-type="mirror"></BlockConnector>		
			</BlockConnectors>
			<!--<Stubs>
				<Stub stub-genus="caller">
					<LangSpecProperties>
						<LangSpecProperty key="vm-cmd-name" value="eval-procedure"></LangSpecProperty>
						<LangSpecProperty key="is-owned-by-breed" value="yes"></LangSpecProperty>
						<LangSpecProperty key="is-breed-set-by-canvas" value="yes"></LangSpecProperty>
						<LangSpecProperty key="stack-type" value="breed"></LangSpecProperty>
					</LangSpecProperties>
				</Stub>
			</Stubs> -->
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="recvd-data"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
                
                <BlockGenus name="xbee" kind="xbee" initlabel="Zigbee" editable-label="no" label-unique="yes" page-label-enabled="yes" is-starter="yes" color="177 10 255">
			<description>
				<text>
					Zigbee wireless communication block.
				</text>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="socket" connector-type="cmd" is-expandable="yes"></BlockConnector>
			</BlockConnectors>
			<Stubs>
				<Stub stub-genus="caller">
					<LangSpecProperties>
						<LangSpecProperty key="vm-cmd-name" value="eval-procedure"></LangSpecProperty>
						<LangSpecProperty key="is-owned-by-breed" value="yes"></LangSpecProperty>
						<LangSpecProperty key="is-breed-set-by-canvas" value="yes"></LangSpecProperty>
						<LangSpecProperty key="stack-type" value="breed"></LangSpecProperty>
					</LangSpecProperties>
				</Stub>
			</Stubs>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="xbee"></LangSpecProperty>
				<LangSpecProperty key="is-owned-by-breed" value="yes"></LangSpecProperty>
				<LangSpecProperty key="is-breed-set-by-canvas" value="yes"></LangSpecProperty>
				<LangSpecProperty key="stack-type" value="breed-procedure"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
                
                
		<!-- Procedure and parameters -->
		
		<BlockGenus name="procedure" kind="procedure" initlabel="Procedure" editable-label="yes" label-unique="yes" page-label-enabled="yes" is-starter="yes" color="177 10 255">
			<description>
				<text>
					Defines a section of blocks as a procedure that can be called from other sections of blocks.
				</text>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="socket" connector-type="poly" is-expandable="yes"></BlockConnector>
			</BlockConnectors>
			<Stubs>
				<Stub stub-genus="caller">
					<LangSpecProperties>
						<LangSpecProperty key="vm-cmd-name" value="eval-procedure"></LangSpecProperty>
						<LangSpecProperty key="is-owned-by-breed" value="yes"></LangSpecProperty>
						<LangSpecProperty key="is-breed-set-by-canvas" value="yes"></LangSpecProperty>
						<LangSpecProperty key="stack-type" value="breed"></LangSpecProperty>
					</LangSpecProperties>
				</Stub>
			</Stubs>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="eval-procedure"></LangSpecProperty>
				<LangSpecProperty key="is-owned-by-breed" value="yes"></LangSpecProperty>
				<LangSpecProperty key="is-breed-set-by-canvas" value="yes"></LangSpecProperty>
				<LangSpecProperty key="stack-type" value="breed-procedure"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="proc-param-number" kind="param" initlabel="number param" editable-label="yes" label-unique="yes" is-starter="yes" is-terminator="yes" color="177 10 255">
			<description>
				<text>
					Adds a number parameter to a procedure.
				</text>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="plug" connector-type="number"></BlockConnector>
			</BlockConnectors>
			<Stubs>
				<Stub stub-genus="getter">
					<LangSpecProperties>
						<LangSpecProperty key="vm-cmd-name" value="eval-local"></LangSpecProperty>
						<LangSpecProperty key="scope" value="local"></LangSpecProperty>
						<LangSpecProperty key="stack-type" value="breed-procedure"></LangSpecProperty>
					</LangSpecProperties>	
				</Stub>
			</Stubs>
			<LangSpecProperties>
				<LangSpecProperty key="type" value="number"></LangSpecProperty>
				<LangSpecProperty key="stack-type" value="breed-procedure"></LangSpecProperty>
			</LangSpecProperties>	
		</BlockGenus>
		
		<BlockGenus name="proc-param-boolean" kind="param" initlabel="boolean param" editable-label="yes" label-unique="yes" is-starter="yes" is-terminator="yes" color="177 10 255">
			<description>
				<text>
					Adds a boolean parameter to a procedure.
				</text>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="plug" connector-type="boolean"></BlockConnector>
			</BlockConnectors>
			<Stubs>
				<Stub stub-genus="getter">
					<LangSpecProperties>
						<LangSpecProperty key="vm-cmd-name" value="eval-local"></LangSpecProperty>
						<LangSpecProperty key="scope" value="local"></LangSpecProperty>
						<LangSpecProperty key="stack-type" value="breed-procedure"></LangSpecProperty>
					</LangSpecProperties>	
				</Stub>
			</Stubs>
			<LangSpecProperties>
				<LangSpecProperty key="type" value="boolean"></LangSpecProperty>
				<LangSpecProperty key="stack-type" value="breed-procedure"></LangSpecProperty>
			</LangSpecProperties>	
		</BlockGenus>
		
		<BlockGenus name="proc-param-string" kind="param" initlabel="text param" editable-label="yes" label-unique="yes" is-starter="yes" is-terminator="yes" color="177 10 255">
			<description>
				<text>
					Adds a text parameter to a procedure.
				</text>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="plug" connector-type="string"></BlockConnector>
			</BlockConnectors>
			<Stubs>
				<Stub stub-genus="getter">
					<LangSpecProperties>
						<LangSpecProperty key="vm-cmd-name" value="eval-local"></LangSpecProperty>
						<LangSpecProperty key="scope" value="local"></LangSpecProperty>
						<LangSpecProperty key="stack-type" value="breed-procedure"></LangSpecProperty>
					</LangSpecProperties>	
				</Stub>
			</Stubs>
			<LangSpecProperties>
				<LangSpecProperty key="type" value="string"></LangSpecProperty>
				<LangSpecProperty key="stack-type" value="breed-procedure"></LangSpecProperty>
			</LangSpecProperties>	
		</BlockGenus>
		
		<BlockGenus name="proc-param-list" kind="param" initlabel="list param" editable-label="yes" label-unique="yes" is-starter="yes" is-terminator="yes" color="177 10 255">
			<description>
				<text>
					Adds a list parameter to a procedure.
				</text>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="plug" connector-type="poly-list"></BlockConnector>
			</BlockConnectors>
			<Stubs>
				<Stub stub-genus="getter">
					<LangSpecProperties>
						<LangSpecProperty key="vm-cmd-name" value="eval-local"></LangSpecProperty>
						<LangSpecProperty key="scope" value="local"></LangSpecProperty>
						<LangSpecProperty key="stack-type" value="breed-procedure"></LangSpecProperty>
					</LangSpecProperties>	
				</Stub>
			</Stubs>
			<LangSpecProperties>
				<LangSpecProperty key="type" value="list"></LangSpecProperty>
				<LangSpecProperty key="stack-type" value="breed-procedure"></LangSpecProperty>
			</LangSpecProperties>	
		</BlockGenus>
		
		<!-- SETUP AND RUNTIME BLOCKS -->
		
		<!-- NOTE: The genus names "forever", "runonce", and "runforsometime" is duplicated in RunBlockManager.java, 
			if you change this name, make sure to change it there too.  -->
		<BlockGenus name="forever" kind="command" initlabel="forever" editable-label="yes" label-unique="yes" is-starter="yes" is-terminator="yes" color="139 0 0">
			<description>
				<text>
					When switched on, agents do commands over and over. <note>There are different commands for each breed.</note>
				</text>
				<arg-description n="1" name="agents" doc-name="breed">
					The breed of the agents performing the commands attached here.
				</arg-description>
			</description>
			<BlockConnectors>
				<BlockConnector label="" connector-kind="socket" connector-type="cmd"></BlockConnector>
			</BlockConnectors>
			<Images>
				<Image block-location="southwest" image-editable="yes" width="15" height="15">
					<FileLocation>support/forever_switch_on.png</FileLocation>
				</Image>
			</Images>
			<LangSpecProperties>
				<LangSpecProperty key="runtime-type" value="forever"></LangSpecProperty>
				<LangSpecProperty key="is-owned-by-breed" value="yes"></LangSpecProperty>
				<LangSpecProperty key="has-runtime-equiv" value="yes"></LangSpecProperty>
				<LangSpecProperty key="stack-type" value="breed-forever"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="runtime-forever" kind="command" initlabel="forever" is-starter="yes" is-terminator="yes" color="139 0 0">
			<description>
				<text>
					When switched on, agents do commands over and over. <note>There are different commands for each breed.</note>
				</text>
			</description>
			<LangSpecProperties>
				<LangSpecProperty key="runtime-type" value="forever"></LangSpecProperty>
				<LangSpecProperty key="has-runtime-equiv" value="yes"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="runonce" kind="command" initlabel="run once" editable-label="yes" label-unique="yes" is-starter="yes" is-terminator="yes" color="139 0 0">
			<description>
				<text>
					When switched on, agents do commands once. <note>There are different commands for each breed.</note>
				</text>
				<arg-description n="1" name="agents" doc-name="breed">
					The breed of the agents performing the commands attached here.
				</arg-description>
			</description>
			<BlockConnectors>
				<BlockConnector label="" connector-kind="socket" connector-type="cmd"></BlockConnector>
			</BlockConnectors>
			<Images>
				<Image block-location="southwest" image-editable="yes" width="15" height="15">
					<FileLocation>support/forever_switch_on.png</FileLocation>
				</Image>
			</Images>
			<LangSpecProperties>
				<LangSpecProperty key="runtime-type" value="runonce"></LangSpecProperty>
				<LangSpecProperty key="is-owned-by-breed" value="yes"></LangSpecProperty>
				<LangSpecProperty key="has-runtime-equiv" value="yes"></LangSpecProperty>
				<LangSpecProperty key="stack-type" value="breed-forever"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="runtime-once" kind="command" initlabel="run once" is-starter="yes" is-terminator="yes" color="139 0 0">
			<description>
				<text>
					When switched on, agents do commands once. <note>There are different commands for each breed.</note>
				</text>
			</description>
			<LangSpecProperties>
				<LangSpecProperty key="runtime-type" value="runonce"></LangSpecProperty>
				<LangSpecProperty key="has-runtime-equiv" value="yes"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="runforsometime" kind="command" initlabel="run" editable-label="yes" label-unique="yes" is-starter="yes" is-terminator="yes" color="139 0 0">
			<description>
				<text>
					When switched on, agents do commands over and over for <arg n="1"/> seconds. <note>There are different commands for each breed.</note>
				</text>
				
				<arg-description n="1" name="secs">
					The number of seconds for which the commands are run when switched on.
				</arg-description>
				
				<arg-description n="2" name="agents" doc-name="breed">
					The breed of the agents performing the commands attached here.
				</arg-description>
			</description>
			<BlockConnectors>
			    <BlockConnector label="secs" connector-kind="socket" connector-type="number">
			    </BlockConnector>
				<BlockConnector connector-kind="socket" connector-type="cmd"></BlockConnector>
			</BlockConnectors>
			<Images>
				<Image block-location="southwest" image-editable="yes" width="15" height="15">
					<FileLocation>support/forever_switch_on.png</FileLocation>
				</Image>
			</Images>
			<LangSpecProperties>
				<LangSpecProperty key="runtime-type" value="runforsometime"></LangSpecProperty>
				<LangSpecProperty key="is-owned-by-breed" value="yes"></LangSpecProperty>
				<LangSpecProperty key="has-runtime-equiv" value="yes"></LangSpecProperty>
				<LangSpecProperty key="stack-type" value="breed-forever"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="runtime-sometime" kind="command" initlabel="run" is-starter="yes" is-terminator="yes" color="139 0 0">
			<description>
				<text>
					When switched on, agents do commands over and over for a number of seconds. <note>There are different commands for each breed.</note>
				</text>
			</description>
			<LangSpecProperties>
				<LangSpecProperty key="runtime-type" value="runforsometime"></LangSpecProperty>
				<LangSpecProperty key="has-runtime-equiv" value="yes"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="setup" kind="command" initlabel="setup" editable-label="yes" label-unique="yes" is-starter="yes" is-terminator="yes" color="139 0 0">
			<description>
				<text>
					This block serves as a wrapper around blocks that set up a model.
				</text>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="socket" connector-type="cmd"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="is-setup" value="yes"></LangSpecProperty>
				<LangSpecProperty key="has-runtime-equiv" value="yes"></LangSpecProperty>
				<LangSpecProperty key="stack-type" value="setup"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="runtime-setup" kind="command" initlabel="setup" is-starter="yes" is-terminator="yes" color="139 0 0">
			<description>
				<text>
					This block serves as a wrapper around blocks that set up a model.
				</text>
			</description>
			<LangSpecProperties>
				<LangSpecProperty key="is-runtime" value="yes"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
	
		
		
		<BlockGenus name="set-score" kind="command" initlabel="set score" color="230 0 255 ">
			<description>
				<text>
					Sets the score to be the given value.
				</text>
				<arg-description n="1" name="score" doc-name="score">
					The new value for the score.
				</arg-description>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="socket" connector-type="number">
					<DefaultArg genus-name="number" label="0" />
				</BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="set-score"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
		
		<BlockGenus name="score" kind="function" initlabel="score" color="230 0 255 ">
			<description>
				<text>
					Reports the current score.
				</text>
			</description>
			<BlockConnectors>
				<BlockConnector connector-kind="plug" position-type="mirror" connector-type="number"></BlockConnector>
			</BlockConnectors>
			<LangSpecProperties>
				<LangSpecProperty key="vm-cmd-name" value="score"></LangSpecProperty>
				<LangSpecProperty key="is-monitorable" value="yes"></LangSpecProperty>
			</LangSpecProperties>
		</BlockGenus>
	
		
		
		
		
	</BlockGenuses>
	
	<BlockFamilies>
		<BlockFamily>
			<FamilyMember>fd</FamilyMember>
			<FamilyMember>left-fd</FamilyMember>
			<FamilyMember>right-fd</FamilyMember>
			<FamilyMember>bk</FamilyMember>
			<FamilyMember>buzzer</FamilyMember>
                        <FamilyMember>up</FamilyMember>
		</BlockFamily>
		<BlockFamily>
			<FamilyMember>true</FamilyMember>
			<FamilyMember>false</FamilyMember>
		</BlockFamily>
		<BlockFamily>
			<FamilyMember>min</FamilyMember>
			<FamilyMember>max</FamilyMember>
		</BlockFamily>
		<BlockFamily>
			<FamilyMember>round</FamilyMember>
			<FamilyMember>int</FamilyMember>
		</BlockFamily>
		<BlockFamily>
			<FamilyMember>sin</FamilyMember>
			<FamilyMember>cos</FamilyMember>
			<FamilyMember>tan</FamilyMember>
		</BlockFamily>
		<BlockFamily>
			<FamilyMember>log</FamilyMember>
			<FamilyMember>ln</FamilyMember>
		</BlockFamily>
		
                <BlockFamily>
			<FamilyMember>numvariable</FamilyMember>
			<FamilyMember>strvariable</FamilyMember>
		</BlockFamily>
		<BlockFamily>
			<FamilyMember>recvd-data</FamilyMember>
			<FamilyMember>xbee</FamilyMember>
		</BlockFamily>
		<BlockFamily>
			<FamilyMember>white-line-right</FamilyMember>
			<FamilyMember>white-line-middle</FamilyMember>
			<FamilyMember>white-line-left</FamilyMember>
			<FamilyMember>front-IR</FamilyMember>
		</BlockFamily>
		<BlockFamily>
			<FamilyMember>xcor</FamilyMember>
			<FamilyMember>ycor</FamilyMember>
		</BlockFamily>
		
		<BlockFamily>
			<FamilyMember>equals</FamilyMember>
                        <FamilyMember>numequals</FamilyMember>
                        <FamilyMember>strequals</FamilyMember>
			<FamilyMember>not-equals</FamilyMember>
			<FamilyMember>lessthan</FamilyMember>
			<FamilyMember>greaterthan</FamilyMember>
			<FamilyMember>lessthanorequalto</FamilyMember>
			<FamilyMember>greaterthanorequalto</FamilyMember>
		</BlockFamily>
		<BlockFamily>
			<FamilyMember>and</FamilyMember>
			<FamilyMember>or</FamilyMember>
		</BlockFamily>
		<BlockFamily>
			<FamilyMember>sum</FamilyMember>
			<FamilyMember>difference</FamilyMember>
			<FamilyMember>quotient</FamilyMember>
			<FamilyMember>product</FamilyMember>
		</BlockFamily>
		
	</BlockFamilies>

	<BlockDrawerSets>	
		<BlockDrawerSet name="factory" type="stack" location="southwest" window-per-drawer="no" drawer-draggable="no" >
			<BlockDrawer name="Run" type="factory" is-open="yes" button-color="173 0 0">
				
				<BlockGenusMember>forever</BlockGenusMember>
				<BlockGenusMember>runforsometime</BlockGenusMember>
				<BlockGenusMember>set-score</BlockGenusMember>
				<BlockGenusMember>score</BlockGenusMember>
			</BlockDrawer>
			<BlockDrawer name="Actuators" type="factory" button-color="247 0 0">
                                <BlockGenusMember>up</BlockGenusMember>
				<BlockGenusMember>fd</BlockGenusMember>
				<BlockGenusMember>bk</BlockGenusMember>
				<BlockGenusMember>left-fd</BlockGenusMember>
				<BlockGenusMember>right-fd</BlockGenusMember>
				<BlockGenusMember>buzzer</BlockGenusMember>
			</BlockDrawer>
			<BlockDrawer name="Logic" type="factory" button-color="255 173 0">
				<BlockGenusMember>if</BlockGenusMember>
				<BlockGenusMember>ifelse</BlockGenusMember>
				<BlockGenusMember>repeat</BlockGenusMember>
				<BlockGenusMember>and</BlockGenusMember>
				<BlockGenusMember>or</BlockGenusMember>
				<BlockGenusMember>not</BlockGenusMember>
				<BlockGenusMember>equals</BlockGenusMember>
                                <BlockGenusMember>numequals</BlockGenusMember>
                                <BlockGenusMember>strequals</BlockGenusMember>
				<BlockGenusMember>lessthan</BlockGenusMember>
				<BlockGenusMember>true</BlockGenusMember>
				<BlockGenusMember>false</BlockGenusMember>
			</BlockDrawer>
			<BlockDrawer name="Sensors" type="factory" button-color="255 235 0">
				<BlockGenusMember>white-line-right</BlockGenusMember>
				<BlockGenusMember>white-line-middle</BlockGenusMember>
				<BlockGenusMember>white-line-left</BlockGenusMember>
				<BlockGenusMember>front-IR</BlockGenusMember>
			</BlockDrawer>
	
                        <BlockDrawer name="Variables" type="factory" button-color="0 255 255">
                                <BlockGenusMember>numvariable</BlockGenusMember>
				<BlockGenusMember>strvariable</BlockGenusMember>
			</BlockDrawer>
                        
			<BlockDrawer name="Math" type="factory" button-color="102 129 255">
				<BlockGenusMember>number</BlockGenusMember>
				<BlockGenusMember>pi</BlockGenusMember>
				<BlockGenusMember>e</BlockGenusMember>
				<BlockGenusMember>sum</BlockGenusMember>
				<BlockGenusMember>difference</BlockGenusMember>
				<BlockGenusMember>product</BlockGenusMember>
				<BlockGenusMember>quotient</BlockGenusMember>
				<BlockGenusMember>equals</BlockGenusMember>
				<BlockGenusMember>not-equals</BlockGenusMember>
				<BlockGenusMember>lessthan</BlockGenusMember>
				<BlockGenusMember>greaterthan</BlockGenusMember>
				<BlockGenusMember>lessthanorequalto</BlockGenusMember>
				<BlockGenusMember>greaterthanorequalto</BlockGenusMember>
				<BlockGenusMember>atan</BlockGenusMember>
				<BlockGenusMember>random</BlockGenusMember>
				<BlockGenusMember>round</BlockGenusMember>
				<BlockGenusMember>int</BlockGenusMember>
				<BlockGenusMember>min</BlockGenusMember>
				<BlockGenusMember>max</BlockGenusMember>
				<BlockGenusMember>remainder</BlockGenusMember>
				<BlockGenusMember>power</BlockGenusMember>
				<BlockGenusMember>abs</BlockGenusMember>
				<BlockGenusMember>sqrt</BlockGenusMember>
				<BlockGenusMember>sin</BlockGenusMember>
				<BlockGenusMember>cos</BlockGenusMember>
				<BlockGenusMember>tan</BlockGenusMember>
				<BlockGenusMember>asin</BlockGenusMember>
				<BlockGenusMember>acos</BlockGenusMember>
				<BlockGenusMember>log</BlockGenusMember>
				<BlockGenusMember>ln</BlockGenusMember>
			</BlockDrawer>
			
			<BlockDrawer name="ZigBee" type="factory" button-color="50 0 255">
				<BlockGenusMember>recvd-data</BlockGenusMember>
				<BlockGenusMember>xbee</BlockGenusMember>
			</BlockDrawer>
			
		</BlockDrawerSet>
	</BlockDrawerSets>


	<!-- drawer-with-page="yes">
		<Page page-name="Runtime" page-width="400">
		
		<PageBlocks><Block id="107" genus-name="forever" ><Location><X>134</X><Y>81</Y></Location><Sockets num-sockets="1" ><BlockConnector connector-kind="socket" connector-type="cmd" init-type="cmd" label="" position-type="single" ></BlockConnector></Sockets></Block></PageBlocks>
		
		</Page>
	-->


	
	
<Pages><Page page-name="Runtime" page-color="40 40 40" page-width="1280" page-infullview="yes" page-drawer="Runtime" ><PageBlocks><Block id="180" genus-name="right-fd" ><Location><X>429</X><Y>580</Y></Location><BeforeBlockId>168</BeforeBlockId><Sockets num-sockets="1" ><BlockConnector connector-kind="socket" connector-type="number" init-type="number" label="steps" position-type="single" con-block-id="182" ></BlockConnector></Sockets></Block><Block id="182" genus-name="number" ><Location><X>603</X><Y>583</Y></Location><Plug><BlockConnector connector-kind="plug" connector-type="number" init-type="number" label="" position-type="mirror" con-block-id="180" ></BlockConnector></Plug></Block><Block id="176" genus-name="fd" ><Location><X>430</X><Y>539</Y></Location><BeforeBlockId>168</BeforeBlockId><Sockets num-sockets="1" ><BlockConnector connector-kind="socket" connector-type="number" init-type="number" label="steps" position-type="single" con-block-id="178" ></BlockConnector></Sockets></Block><Block id="178" genus-name="number" ><Location><X>538</X><Y>542</Y></Location><Plug><BlockConnector connector-kind="plug" connector-type="number" init-type="number" label="" position-type="mirror" con-block-id="176" ></BlockConnector></Plug></Block><Block id="174" genus-name="white-line-right" ><Location><X>536</X><Y>509</Y></Location><Plug><BlockConnector connector-kind="plug" connector-type="number" init-type="number" label="" position-type="mirror" con-block-id="170" ></BlockConnector></Plug></Block><Block id="172" genus-name="number" ><Label>128</Label><Location><X>443</X><Y>509</Y></Location><Plug><BlockConnector connector-kind="plug" connector-type="number" init-type="number" label="" position-type="mirror" con-block-id="170" ></BlockConnector></Plug></Block><Block id="170" genus-name="lessthan" ><Location><X>433</X><Y>506</Y></Location><Plug><BlockConnector connector-kind="plug" connector-type="boolean" init-type="boolean" label="" position-type="mirror" con-block-id="168" ></BlockConnector></Plug><Sockets num-sockets="2" ><BlockConnector connector-kind="socket" connector-type="number" init-type="number" label="" position-type="bottom" con-block-id="172" ></BlockConnector><BlockConnector connector-kind="socket" connector-type="number" init-type="number" label="" position-type="bottom" con-block-id="174" ></BlockConnector></Sockets></Block><Block id="154" genus-name="lessthan" ><Location><X>434</X><Y>378</Y></Location><Plug><BlockConnector connector-kind="plug" connector-type="boolean" init-type="boolean" label="" position-type="mirror" con-block-id="152" ></BlockConnector></Plug><Sockets num-sockets="2" ><BlockConnector connector-kind="socket" connector-type="number" init-type="number" label="" position-type="bottom" con-block-id="156" ></BlockConnector><BlockConnector connector-kind="socket" connector-type="number" init-type="number" label="" position-type="bottom" con-block-id="158" ></BlockConnector></Sockets></Block><Block id="158" genus-name="white-line-right" ><Location><X>537</X><Y>381</Y></Location><Plug><BlockConnector connector-kind="plug" connector-type="number" init-type="number" label="" position-type="mirror" con-block-id="154" ></BlockConnector></Plug></Block><Block id="156" genus-name="number" ><Label>128</Label><Location><X>444</X><Y>381</Y></Location><Plug><BlockConnector connector-kind="plug" connector-type="number" init-type="number" label="" position-type="mirror" con-block-id="154" ></BlockConnector></Plug></Block><Block id="146" genus-name="lessthan" ><Location><X>355</X><Y>342</Y></Location><Plug><BlockConnector connector-kind="plug" connector-type="boolean" init-type="boolean" label="" position-type="mirror" con-block-id="144" ></BlockConnector></Plug><Sockets num-sockets="2" ><BlockConnector connector-kind="socket" connector-type="number" init-type="number" label="" position-type="bottom" con-block-id="148" ></BlockConnector><BlockConnector connector-kind="socket" connector-type="number" init-type="number" label="" position-type="bottom" con-block-id="150" ></BlockConnector></Sockets></Block><Block id="150" genus-name="white-line-left" ><Location><X>458</X><Y>345</Y></Location><Plug><BlockConnector connector-kind="plug" connector-type="number" init-type="number" label="" position-type="mirror" con-block-id="146" ></BlockConnector></Plug></Block><Block id="148" genus-name="number" ><Label>128</Label><Location><X>365</X><Y>345</Y></Location><Plug><BlockConnector connector-kind="plug" connector-type="number" init-type="number" label="" position-type="mirror" con-block-id="146" ></BlockConnector></Plug></Block><Block id="168" genus-name="ifelse" ><Location><X>351</X><Y>503</Y></Location><BeforeBlockId>144</BeforeBlockId><Sockets num-sockets="3" ><BlockConnector connector-kind="socket" connector-type="boolean" init-type="boolean" label="test" position-type="single" con-block-id="170" ></BlockConnector><BlockConnector connector-kind="socket" connector-type="cmd" init-type="cmd" label="then" position-type="single" con-block-id="176" ></BlockConnector><BlockConnector connector-kind="socket" connector-type="cmd" init-type="cmd" label="else" position-type="single" con-block-id="180" ></BlockConnector></Sockets></Block><Block id="164" genus-name="left-fd" ><Location><X>430</X><Y>452</Y></Location><BeforeBlockId>152</BeforeBlockId><Sockets num-sockets="1" ><BlockConnector connector-kind="socket" connector-type="number" init-type="number" label="steps" position-type="single" con-block-id="166" ></BlockConnector></Sockets></Block><Block id="166" genus-name="number" ><Location><X>596</X><Y>455</Y></Location><Plug><BlockConnector connector-kind="plug" connector-type="number" init-type="number" label="" position-type="mirror" con-block-id="164" ></BlockConnector></Plug></Block><Block id="160" genus-name="fd" ><Location><X>431</X><Y>411</Y></Location><BeforeBlockId>152</BeforeBlockId><Sockets num-sockets="1" ><BlockConnector connector-kind="socket" connector-type="number" init-type="number" label="steps" position-type="single" con-block-id="162" ></BlockConnector></Sockets></Block><Block id="162" genus-name="number" ><Location><X>539</X><Y>414</Y></Location><Plug><BlockConnector connector-kind="plug" connector-type="number" init-type="number" label="" position-type="mirror" con-block-id="160" ></BlockConnector></Plug></Block><Block id="152" genus-name="ifelse" ><Location><X>352</X><Y>375</Y></Location><BeforeBlockId>144</BeforeBlockId><Sockets num-sockets="3" ><BlockConnector connector-kind="socket" connector-type="boolean" init-type="boolean" label="test" position-type="single" con-block-id="154" ></BlockConnector><BlockConnector connector-kind="socket" connector-type="cmd" init-type="cmd" label="then" position-type="single" con-block-id="160" ></BlockConnector><BlockConnector connector-kind="socket" connector-type="cmd" init-type="cmd" label="else" position-type="single" con-block-id="164" ></BlockConnector></Sockets></Block><Block id="144" genus-name="ifelse" ><Location><X>273</X><Y>339</Y></Location><BeforeBlockId>108</BeforeBlockId><Sockets num-sockets="3" ><BlockConnector connector-kind="socket" connector-type="boolean" init-type="boolean" label="test" position-type="single" con-block-id="146" ></BlockConnector><BlockConnector connector-kind="socket" connector-type="cmd" init-type="cmd" label="then" position-type="single" con-block-id="152" ></BlockConnector><BlockConnector connector-kind="socket" connector-type="cmd" init-type="cmd" label="else" position-type="single" con-block-id="168" ></BlockConnector></Sockets></Block><Block id="140" genus-name="right-fd" ><Location><X>352</X><Y>289</Y></Location><BeforeBlockId>116</BeforeBlockId><Sockets num-sockets="1" ><BlockConnector connector-kind="socket" connector-type="number" init-type="number" label="steps" position-type="single" con-block-id="142" ></BlockConnector></Sockets></Block><Block id="142" genus-name="number" ><Location><X>526</X><Y>292</Y></Location><Plug><BlockConnector connector-kind="plug" connector-type="number" init-type="number" label="" position-type="mirror" con-block-id="140" ></BlockConnector></Plug></Block><Block id="136" genus-name="left-fd" ><Location><X>431</X><Y>238</Y></Location><BeforeBlockId>124</BeforeBlockId><Sockets num-sockets="1" ><BlockConnector connector-kind="socket" connector-type="number" init-type="number" label="steps" position-type="single" con-block-id="138" ></BlockConnector></Sockets></Block><Block id="138" genus-name="number" ><Location><X>597</X><Y>241</Y></Location><Plug><BlockConnector connector-kind="plug" connector-type="number" init-type="number" label="" position-type="mirror" con-block-id="136" ></BlockConnector></Plug></Block><Block id="132" genus-name="buzzer" ><Location><X>432</X><Y>197</Y></Location><BeforeBlockId>124</BeforeBlockId><Sockets num-sockets="1" ><BlockConnector connector-kind="socket" connector-type="number" init-type="number" label="steps" position-type="single" con-block-id="134" ></BlockConnector></Sockets></Block><Block id="134" genus-name="number" ><Location><X>532</X><Y>200</Y></Location><Plug><BlockConnector connector-kind="plug" connector-type="number" init-type="number" label="" position-type="mirror" con-block-id="132" ></BlockConnector></Plug></Block><Block id="130" genus-name="white-line-right" ><Location><X>538</X><Y>167</Y></Location><Plug><BlockConnector connector-kind="plug" connector-type="number" init-type="number" label="" position-type="mirror" con-block-id="126" ></BlockConnector></Plug></Block><Block id="128" genus-name="number" ><Label>128</Label><Location><X>445</X><Y>167</Y></Location><Plug><BlockConnector connector-kind="plug" connector-type="number" init-type="number" label="" position-type="mirror" con-block-id="126" ></BlockConnector></Plug></Block><Block id="126" genus-name="lessthan" ><Location><X>435</X><Y>164</Y></Location><Plug><BlockConnector connector-kind="plug" connector-type="boolean" init-type="boolean" label="" position-type="mirror" con-block-id="124" ></BlockConnector></Plug><Sockets num-sockets="2" ><BlockConnector connector-kind="socket" connector-type="number" init-type="number" label="" position-type="bottom" con-block-id="128" ></BlockConnector><BlockConnector connector-kind="socket" connector-type="number" init-type="number" label="" position-type="bottom" con-block-id="130" ></BlockConnector></Sockets></Block><Block id="124" genus-name="ifelse" ><Location><X>353</X><Y>161</Y></Location><BeforeBlockId>116</BeforeBlockId><Sockets num-sockets="3" ><BlockConnector connector-kind="socket" connector-type="boolean" init-type="boolean" label="test" position-type="single" con-block-id="126" ></BlockConnector><BlockConnector connector-kind="socket" connector-type="cmd" init-type="cmd" label="then" position-type="single" con-block-id="132" ></BlockConnector><BlockConnector connector-kind="socket" connector-type="cmd" init-type="cmd" label="else" position-type="single" con-block-id="136" ></BlockConnector></Sockets></Block><Block id="122" genus-name="white-line-left" ><Location><X>459</X><Y>131</Y></Location><Plug><BlockConnector connector-kind="plug" connector-type="number" init-type="number" label="" position-type="mirror" con-block-id="118" ></BlockConnector></Plug></Block><Block id="120" genus-name="number" ><Label>128</Label><Location><X>366</X><Y>131</Y></Location><Plug><BlockConnector connector-kind="plug" connector-type="number" init-type="number" label="" position-type="mirror" con-block-id="118" ></BlockConnector></Plug></Block><Block id="118" genus-name="lessthan" ><Location><X>356</X><Y>128</Y></Location><Plug><BlockConnector connector-kind="plug" connector-type="boolean" init-type="boolean" label="" position-type="mirror" con-block-id="116" ></BlockConnector></Plug><Sockets num-sockets="2" ><BlockConnector connector-kind="socket" connector-type="number" init-type="number" label="" position-type="bottom" con-block-id="120" ></BlockConnector><BlockConnector connector-kind="socket" connector-type="number" init-type="number" label="" position-type="bottom" con-block-id="122" ></BlockConnector></Sockets></Block><Block id="116" genus-name="ifelse" ><Location><X>274</X><Y>125</Y></Location><BeforeBlockId>108</BeforeBlockId><Sockets num-sockets="3" ><BlockConnector connector-kind="socket" connector-type="boolean" init-type="boolean" label="test" position-type="single" con-block-id="118" ></BlockConnector><BlockConnector connector-kind="socket" connector-type="cmd" init-type="cmd" label="then" position-type="single" con-block-id="124" ></BlockConnector><BlockConnector connector-kind="socket" connector-type="cmd" init-type="cmd" label="else" position-type="single" con-block-id="140" ></BlockConnector></Sockets></Block><Block id="114" genus-name="white-line-middle" ><Location><X>380</X><Y>95</Y></Location><Plug><BlockConnector connector-kind="plug" connector-type="number" init-type="number" label="" position-type="mirror" con-block-id="110" ></BlockConnector></Plug></Block><Block id="112" genus-name="number" ><Label>170</Label><Location><X>287</X><Y>95</Y></Location><Plug><BlockConnector connector-kind="plug" connector-type="number" init-type="number" label="" position-type="mirror" con-block-id="110" ></BlockConnector></Plug></Block><Block id="110" genus-name="lessthan" ><Location><X>277</X><Y>92</Y></Location><Plug><BlockConnector connector-kind="plug" connector-type="boolean" init-type="boolean" label="" position-type="mirror" con-block-id="108" ></BlockConnector></Plug><Sockets num-sockets="2" ><BlockConnector connector-kind="socket" connector-type="number" init-type="number" label="" position-type="bottom" con-block-id="112" ></BlockConnector><BlockConnector connector-kind="socket" connector-type="number" init-type="number" label="" position-type="bottom" con-block-id="114" ></BlockConnector></Sockets></Block><Block id="108" genus-name="ifelse" ><Location><X>195</X><Y>89</Y></Location><BeforeBlockId>107</BeforeBlockId><Sockets num-sockets="3" ><BlockConnector connector-kind="socket" connector-type="boolean" init-type="boolean" label="test" position-type="single" con-block-id="110" ></BlockConnector><BlockConnector connector-kind="socket" connector-type="cmd" init-type="cmd" label="then" position-type="single" con-block-id="116" ></BlockConnector><BlockConnector connector-kind="socket" connector-type="cmd" init-type="cmd" label="else" position-type="single" con-block-id="144" ></BlockConnector></Sockets></Block><Block id="107" genus-name="forever" ><Location><X>134</X><Y>81</Y></Location><Sockets num-sockets="1" ><BlockConnector connector-kind="socket" connector-type="cmd" init-type="cmd" label="" position-type="single" con-block-id="108" ></BlockConnector></Sockets></Block></PageBlocks></Page></Pages>
</BlockLangDef>
