/** The main class **/

package controller;

import codeblocks.Block;
import codeblocks.BlockConnector;
import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.StringReader;

import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JComponent;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import workspace.SearchBar;
import workspace.SearchableContainer;
import workspace.TrashCan;
import workspace.Workspace;
import codeblocks.BlockConnectorShape;
import codeblocks.BlockGenus;
import codeblocks.BlockLinkChecker;
import codeblocks.CommandRule;
import codeblocks.SocketRule;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.Collection;
import java.util.Iterator;
import java.util.Scanner;
import javax.swing.JFileChooser;
import renderable.RenderableBlock;
import workspace.Page;

/**
 *
 * The WorkspaceController is the starting point for any program using Open Blocks.
 * It contains a Workspace (the block programming area) as well as the Factories
 * (the palettes of blocks), and is responsible for setting up and laying out
 * the overall window including loading some WorkspaceWidgets like the TrashCan.
 *
 * @author Ricarose Roque
 */
public class WorkspaceController {

    // path to lang_def.xml file
    private static String LANG_DEF_FILEPATH;
    private static Element langDefRoot;

    //flags
    private boolean isWorkspacePanelInitialized = false;
    /** The single instance of the Workspace Controller **/
    protected static Workspace workspace;
    protected JPanel workspacePanel;
    protected SearchBar searchBar;

    //flag to indicate if a new lang definition file has been set
    private boolean langDefDirty = true;

    //flag to indicate if a workspace has been loaded/initialized
    private boolean workspaceLoaded = false;

    /**
     * Constructs a WorkspaceController instance that manages the
     * interaction with the codeblocks.Workspace
     *
     */
    public WorkspaceController() {
        workspace = Workspace.getInstance();
    }


    /*    */
    /**
     * Returns the single instance of this
     * @return the single instance of this
     *//*
    public static WorkspaceController getInstance(){
    return wc;
    }*/

    ////////////////////
    //  LANG DEF FILE //
    ////////////////////
    /**
     * Sets the file path for the language definition file, if the
     * language definition file is located in
     * @param filePath
     */
    public void setLangDefFilePath(String filePath) {

        LANG_DEF_FILEPATH = filePath; //TODO do we really need to save the file path?

        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder;
        Document doc;
        try {
            builder = factory.newDocumentBuilder();

            String langDefLocation = LANG_DEF_FILEPATH;
            doc = builder.parse(new File(langDefLocation));

            langDefRoot = doc.getDocumentElement();

            //set the dirty flag for the language definition file
            //to true now that a new file has been set
            langDefDirty = true;

        } catch (ParserConfigurationException e) {
        } catch (SAXException e) {
        } catch (IOException e) {
        }

    }

    /**
     * Sets the contents of the Lang Def File to the specified
     * String langDefContents
     * @param langDefContents String contains the specification of a language
     * definition file
     */
    public void setLangDefFileString(String langDefContents) {
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder;
        Document doc;
        try {
            builder = factory.newDocumentBuilder();
            doc = builder.parse(new InputSource(new StringReader(langDefContents)));
            langDefRoot = doc.getDocumentElement();

            //set the dirty flag for the language definition file
            //to true now that a new file has been set
            langDefDirty = true;

        } catch (ParserConfigurationException e) {
            e.printStackTrace();
        } catch (SAXException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * Sets the Lang Def File to the specified File langDefFile.
     * @param langDefFile File contains the specification of the a language
     * definition file.
     */
    public void setLangDefFile(File langDefFile) {
        //LANG_DEF_FILEPATH = langDefFile.getCanonicalPath();

        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder;
        Document doc;
        try {
            builder = factory.newDocumentBuilder();

            doc = builder.parse(langDefFile);

            langDefRoot = doc.getDocumentElement();

            //set the dirty flag for the language definition file
            //to true now that a new file has been set
            langDefDirty = true;

        } catch (ParserConfigurationException e) {
            e.printStackTrace();
        } catch (SAXException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * Loads all the block genuses, properties, and link rules of
     * a language specified in the pre-defined language def file.
     * @param root Loads the language specified in the Element root
     */
    public void loadBlockLanguage(Element root) {
        //load connector shapes
        //MUST load shapes before genuses in order to initialize connectors within
        //each block correctly
        BlockConnectorShape.loadBlockConnectorShapes(root);

        //load genera
        BlockGenus.loadBlockGenera(root);


        //load rules
        BlockLinkChecker.addRule(new CommandRule());
        BlockLinkChecker.addRule(new SocketRule());

        //set the dirty flag for the language definition file
        //to false now that the lang file has been loaded
        langDefDirty = false;
    }

    /**
     * Resets the current language within the active
     * Workspace.
     *
     */
    public void resetLanguage() {
        //clear shape mappings
        BlockConnectorShape.resetConnectorShapeMappings();
        //clear block genuses
        BlockGenus.resetAllGenuses();
        //clear all link rules
        BlockLinkChecker.reset();
    }


    ////////////////////////
    // SAVING AND LOADING //
    ////////////////////////
    /**
     * Returns the save string for the entire workspace.  This includes the block workspace, any
     * custom factories, canvas view state and position, pages
     * @return the save string for the entire workspace.
     */
    public String getSaveString() {
        StringBuilder saveString = new StringBuilder();
        //append the save data
        saveString.append("<?xml version=\"1.0\" encoding=\"ISO-8859\"?>");
        saveString.append("\r\n");
        //dtd file path may not be correct...
        //saveString.append("<!DOCTYPE StarLogo-TNG SYSTEM \""+SAVE_FORMAT_DTD_FILEPATH+"\">");
        //append root node
        saveString.append("<CODEBLOCKS>");
        saveString.append(workspace.getSaveString());
        saveString.append("</CODEBLOCKS>");
        return saveString.toString();
    }

    /**
     * Loads a fresh workspace based on the default specifications in the language
     * definition file.  The block canvas will have no live blocks.
     */
    public void loadFreshWorkspace() {
        //need to just reset workspace (no need to reset language) unless
        //language was never loaded
        //reset only if workspace actually exists
        if (workspaceLoaded) {
            resetWorkspace();
        }

        if (langDefDirty) {
            loadBlockLanguage(langDefRoot);
        }

        workspace.loadWorkspaceFrom(null, langDefRoot);

        workspaceLoaded = true;
    }

    /**
     * Loads the programming project from the specified file path.
     * This method assumes that a Language Definition File has already
     * been specified for this programming project.
     * @param path String file path of the programming project to load
     */
    public void loadProjectFromPath(String path) {
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder;
        Document doc;
        try {
            builder = factory.newDocumentBuilder();

            doc = builder.parse(new File(path));
            // System.out.println(doc.getDocumentElement().getTextContent());
            Element projectRoot = doc.getDocumentElement();

            //load the canvas (or pages and page blocks if any) blocks from the save file
            //also load drawers, or any custom drawers from file.  if no custom drawers
            //are present in root, then the default set of drawers is loaded from
            //langDefRoot
            workspace.loadWorkspaceFrom(projectRoot, langDefRoot);

            workspaceLoaded = true;

        } catch (ParserConfigurationException e) {
            e.printStackTrace();
        } catch (SAXException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * Loads the programming project specified in the projectContents.
     * This method assumes that a Language Definition File has already been
     * specified for this programming project.
     * @param projectContents
     */
    public void loadProject(String projectContents) {
        //need to reset workspace and language (only if new language has been set)

        //reset only if workspace actually exists
        if (workspaceLoaded) {
            resetWorkspace();
        }

        /*  if(langDefDirty)
        loadBlockLanguage(langDefRoot);*/

        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder;
        Document doc;
        try {
            builder = factory.newDocumentBuilder();
            doc = builder.parse(new InputSource(new StringReader(projectContents)));
            Element root = doc.getDocumentElement();
            //load the canvas (or pages and page blocks if any) blocks from the save file
            //also load drawers, or any custom drawers from file.  if no custom drawers
            //are present in root, then the default set of drawers is loaded from
            //langDefRoot
            workspace.loadWorkspaceFrom(root, langDefRoot);

            workspaceLoaded = true;

        } catch (ParserConfigurationException e) {
            e.printStackTrace();
        } catch (SAXException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    /**
     * Loads the programming project specified in the projectContents String,
     * which is associated with the language definition file contained in the
     * specified langDefContents.  All the blocks contained in projectContents
     * must have an associted block genus defined in langDefContents.
     *
     * If the langDefContents have any workspace settings such as pages or
     * drawers and projectContents has workspace settings as well, the
     * workspace settings within the projectContents will override the
     * workspace settings in langDefContents.
     *
     * NOTE: The language definition contained in langDefContents does
     * not replace the default language definition file set by: setLangDefFilePath() or
     * setLangDefFile().
     *
     * @param projectContents
     * @param langDefContents String XML that defines the language of
     * projectContents
     */
    public void loadProject(String projectContents, String langDefContents) {

        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder;
        Document projectDoc;
        Document langDoc;
        try {
            builder = factory.newDocumentBuilder();
            projectDoc = builder.parse(new InputSource(new StringReader(projectContents)));
            Element projectRoot = projectDoc.getDocumentElement();
            langDoc = builder.parse(new InputSource(new StringReader(projectContents)));
            Element langRoot = langDoc.getDocumentElement();

            //need to reset workspace and language (if langDefContents != null)
            //reset only if workspace actually exists
            if (workspaceLoaded) {
                resetWorkspace();
            }

            if (langDefContents == null) {
                loadBlockLanguage(langDefRoot);
            } else {
                loadBlockLanguage(langRoot);
            }
            //TODO should verify that the roots of the two XML strings are valid
            workspace.loadWorkspaceFrom(projectRoot, langRoot);

            workspaceLoaded = true;

        } catch (ParserConfigurationException e) {
            e.printStackTrace();
        } catch (SAXException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * Resets the entire workspace.  This includes all blocks, pages, drawers, and trashed blocks.
     * Also resets the undo/redo stack.  The language (i.e. genuses and shapes) is not reset.
     */
    public void resetWorkspace() {
        //clear all pages and their drawers
        //clear all drawers and their content
        //clear all block and renderable block instances
        workspace.reset();
    //clear action history
    //rum.reset();
    //clear runblock manager data
    //rbm.reset();
    }

    /**
     * This method creates and lays out the entire workspace panel with its
     * different components.  Workspace and language data not loaded in
     * this function.
     * Should be call only once at application startup.
     */
    private void initWorkspacePanel() {

        //add trashcan and prepare trashcan images
        ImageIcon tc = new ImageIcon("support/images/trash.png");
        ImageIcon openedtc = new ImageIcon("support/images/trash_open.png");
        TrashCan trash = new TrashCan(tc.getImage(), openedtc.getImage());
        workspace.addWidget(trash, true, true);


        workspacePanel = new JPanel();
        workspacePanel.setLayout(new BorderLayout());
        workspacePanel.add(workspace, BorderLayout.CENTER);

        isWorkspacePanelInitialized = true;
    }

    /**
     * Returns the JComponent of the entire workspace.
     * @return the JComponent of the entire workspace.
     */
    public JComponent getWorkspacePanel() {
        if (!isWorkspacePanelInitialized) {
            initWorkspacePanel();
        }
        return workspacePanel;
    }

    /**
     * Returns a SearchBar instance capable of searching for blocks
     * within the BlockCanvas and block drawers
     * @return 
     */
    public JComponent getSearchBar() {
        SearchBar searchBar = new SearchBar("Search blocks", "Search for blocks in the drawers and workspace", workspace);
        for (SearchableContainer con : getAllSearchableContainers()) {
            searchBar.addSearchableContainer(con);
        }

        return searchBar.getComponent();
    }

    /**
     * Returns an unmodifiable Iterable of SearchableContainers
     * @return an unmodifiable Iterable of SearchableContainers
     */
    public Iterable<SearchableContainer> getAllSearchableContainers() {
        return workspace.getAllSearchableContainers();
    }

    /////////////////////////////////////
    // TESTING CODEBLOCKS SEPARATELY //
    /////////////////////////////////////
    /**
     * Create the GUI and show it.  For thread safety,
     * this method should be invoked from the
     * event-dispatching thread.
     */
    private static void createAndShowGUI(final WorkspaceController wc) {
        System.out.println("Creating GUI... Please Wait.");

        //Create and set up the window.
        JFrame frame = new JFrame("OpenBlocks Demo");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
//        int inset = 50;
//        Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();

        frame.setBounds(100, 100, 800, 500);

        //create search bar
        SearchBar searchBar = new SearchBar("Search blocks", "Search for blocks in the drawers and workspace", workspace);
        for (SearchableContainer con : wc.getAllSearchableContainers()) {
            searchBar.addSearchableContainer(con);
        }

        // create save button
        JButton saveButton = new JButton("Save");
        JButton openButton = new JButton("Open");
        JButton codeButton = new JButton("Get C Code");
        JButton buildButton = new JButton("Get C Code and Build");
        saveButton.addActionListener(new ActionListener() {

            public void actionPerformed(ActionEvent e) {
                final JFileChooser fc = new JFileChooser();
                int returnVal = fc.showSaveDialog(WorkspaceController.workspace);
                if (returnVal == JFileChooser.APPROVE_OPTION) {
                    File file = fc.getSelectedFile();
                    System.out.println("Writing to :" + file.getPath());
                    StringBuilder text = new StringBuilder();
                    String NL = System.getProperty("line.separator");
                    Scanner scanner = null;
                    try {
                        scanner = new Scanner(new FileInputStream(WorkspaceController.LANG_DEF_FILEPATH), "UTF-16");
                    } catch (FileNotFoundException ex) {
                        Logger.getLogger(WorkspaceController.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    try {
                        while (scanner.hasNextLine()) {
                            text.append(scanner.nextLine()).append(NL);
                        }
                    } finally {
                        scanner.close();
                    }

                    //Convert the string to a byte array.
                    String langDef = text.toString();
                    String s = workspace.getSaveString();
                    langDef = langDef.replaceAll("<Pages", "<!--");
                    langDef = langDef.replaceAll("</Pages>", "-->");
                    langDef = langDef.replaceAll("</BlockLangDef>", s + NL + "</BlockLangDef>");
                    s = langDef;


                    OutputStream out = null;
                    try {
                        byte data[] = s.getBytes("UTF-16");
                        out = new BufferedOutputStream(new FileOutputStream(file));

                        out.write(data, 0, data.length);
                    } catch (IOException x) {
                        System.err.println(x);
                    } finally {
                        if (out != null) {
                            try {
                                out.flush();
                                out.close();
                            } catch (IOException ex) {
                                Logger.getLogger(WorkspaceController.class.getName()).log(Level.SEVERE, null, ex);
                            }

                        }
                    }

                } else {
                }

                System.out.println(workspace.getSaveString());
            }
        });


        openButton.addActionListener(new ActionListener() {

            public void actionPerformed(ActionEvent e) {
                final JFileChooser fc = new JFileChooser();
                int returnVal = fc.showOpenDialog(WorkspaceController.workspace);
                if (returnVal == JFileChooser.APPROVE_OPTION) {
                    File file = fc.getSelectedFile();


                    System.out.println("Loading");

                    wc.resetLanguage();
                    wc.resetWorkspace();
                    WorkspaceController.LANG_DEF_FILEPATH = file.getPath();
                    wc.setLangDefFilePath(file.getPath());
                    wc.loadFreshWorkspace();


                } else {
                }


            }
        });

        codeButton.addActionListener(new ActionListener() {

            public void actionPerformed(ActionEvent e) {


                final JFileChooser fc = new JFileChooser();
                int returnVal = fc.showSaveDialog(WorkspaceController.workspace);

                if (returnVal == JFileChooser.APPROVE_OPTION) {
                  File file = fc.getSelectedFile();




                DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
                DocumentBuilder builder;
                Document doc;
                String NL = System.getProperty("line.separator");
                StringBuilder sb = new StringBuilder("//Start of the program"+NL);
                StringBuilder sb1 = new StringBuilder("");
                    sb.append("#include <firebird.h>").append(NL);
                    sb.append("unsigned int count;").append(NL);
                    sb1.append("void main(){").append(NL);
                    sb1.append("init_devices();").append(NL);
                try {
                    builder = factory.newDocumentBuilder();
                    doc = builder.parse(new InputSource(new StringReader(workspace.getSaveString())));
                    Element root = doc.getDocumentElement();
                    Page page = workspace.getPageNamed("Runtime");
                      for (RenderableBlock topBlock : page.getTopLevelBlocks()) {
                          System.out.println("Top block: " + topBlock.getBlock().getBlockLabel());
                          if(!topBlock.getBlock().getGenusName().equals("forever"))
                          {
                              StringBuilder zigbee = new StringBuilder("");
                              zigbee.append(wc.generateCode(topBlock.getBlock()));
                              System.out.println("Top block: " + topBlock.getBlock().getBlockLabel());
                              sb.append(zigbee).append(NL);
                          }
                          else
                          {//Generate the outermost loop
                              sb1.append(wc.generateCode(topBlock.getBlock()));
                          }
                      }
                    sb1.append(NL).append("}");
                    sb.append(sb1);
                    System.out.println("#####################################");
                    
                    System.out.println(sb.toString());
                    System.out.println("#####################################");

                    OutputStream out = null;
                    try {
                        byte data[] = sb.toString().getBytes();
                        out = new BufferedOutputStream(new FileOutputStream(file));

                        out.write(data, 0, data.length);
                    } catch (IOException x) {
                        System.err.println(x);
                    } finally {
                        if (out != null) {
                            try {
                                out.flush();
                                out.close();
                            } catch (IOException ex) {
                                Logger.getLogger(WorkspaceController.class.getName()).log(Level.SEVERE, null, ex);
                            }

                        }
                    }

                } catch (ParserConfigurationException ex) {
                } catch (SAXException xe) {
                } catch (IOException xe) {
                }
            }

            }


        });
        
        
        //in progress. yet to be completed
        buildButton.addActionListener(new ActionListener() {

            public void actionPerformed(ActionEvent e) {


                final JFileChooser fc = new JFileChooser();
                int returnVal = fc.showSaveDialog(WorkspaceController.workspace);

                if (returnVal == JFileChooser.APPROVE_OPTION) {
                  File file = fc.getSelectedFile();

                DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
                DocumentBuilder builder;
                Document doc;
                String NL = System.getProperty("line.separator");
                StringBuilder sb = new StringBuilder("//Start of the program"+NL);
                StringBuilder sb1 = new StringBuilder("");
                    sb.append("#include <firebird.h>").append(NL);
                    sb.append("unsigned int count;").append(NL);
                    sb1.append("void main(){").append(NL);
                    sb1.append("init_devices();").append(NL);
                try {
                    builder = factory.newDocumentBuilder();
                    doc = builder.parse(new InputSource(new StringReader(workspace.getSaveString())));
                    Element root = doc.getDocumentElement();
                    Page page = workspace.getPageNamed("Runtime");
                      for (RenderableBlock topBlock : page.getTopLevelBlocks()) {
                          System.out.println("Top block: " + topBlock.getBlock().getBlockLabel());
                          if(!topBlock.getBlock().getGenusName().equals("forever"))
                          {
                              StringBuilder zigbee = new StringBuilder("");
                              zigbee.append(wc.generateCode(topBlock.getBlock()));
                              System.out.println("Top block: " + topBlock.getBlock().getBlockLabel());
                              sb.append(zigbee).append(NL);
                          }
                          else
                          {//Generate the outermost loop
                              sb1.append(wc.generateCode(topBlock.getBlock()));
                          }
                      }
                    sb1.append(NL).append("}");
                    sb.append(sb1);
                    System.out.println("#####################################");
                    
                    System.out.println(sb.toString());
                    System.out.println("#####################################");

                    OutputStream out = null;
                    try
                    {
                        byte data[] = sb.toString().getBytes();
                        out = new BufferedOutputStream(new FileOutputStream(file));

                        out.write(data, 0, data.length);
                        
                        //write code to call batch file which has the avr build command
                        try 
                        {
                            ProcessBuilder pb = new ProcessBuilder("cmd", "/C", "Start", "C:\\Users\\DR.D.LAXMANA RAO\\Desktop\\VisualFirebird\\build.bat", file.getName());
                            Process p = pb.start();
                            p.waitFor();
                            System.out.println("Build complete");
                        }
                        catch (Exception ex) 
                        {
                            ex.printStackTrace();
                            //JOptionPane.showMessageDialog(this, "Error" +"Execution!","Error",JOptionPane.ERROR_MESSAGE);
                        }
                    }
                    catch (IOException x) 
                    {
                        System.err.println(x);
                    } 
                    finally 
                    {
                        if (out != null) 
                        {
                            try 
                            {
                                out.flush();
                                out.close();
                            } 
                            catch (IOException ex) 
                            {
                                Logger.getLogger(WorkspaceController.class.getName()).log(Level.SEVERE, null, ex);
                            }

                        }
                    }

                } 
                catch (ParserConfigurationException ex) 
                {
                } 
                catch (SAXException xe) 
                {
                } 
                catch (IOException xe) 
                {
                }
            }

            }


        });
        
        JPanel topPane = new JPanel();
        searchBar.getComponent().setPreferredSize(new Dimension(130, 123));
        //  topPane.add(searchBar.getComponent());
        topPane.add(saveButton);
        topPane.add(openButton);
        topPane.add(codeButton);
        topPane.add(buildButton);
        frame.add(topPane, BorderLayout.NORTH);
        frame.add(wc.getWorkspacePanel(), BorderLayout.CENTER);

        frame.setVisible(true);

    }

    //The main function
    public static void main(String[] args) {
        //Schedule a job for the event-dispatching thread:
        //creating and showing this application's GUI.
        // swing used for GUI
        javax.swing.SwingUtilities.invokeLater(new Runnable() { 

            public void run() {
                //TODO grab file path from args array

                LANG_DEF_FILEPATH = "support/lang_def.xml";

                //Create a new WorkspaceController
                WorkspaceController wc = new WorkspaceController();

                wc.setLangDefFilePath(LANG_DEF_FILEPATH);
                wc.loadFreshWorkspace();

                createAndShowGUI(wc);
            }
        });
    }

    public static void initWithLangDefFilePath(final String langDefFilePath) {

        javax.swing.SwingUtilities.invokeLater(new Runnable() {

            public void run() {

                //Create a new WorkspaceController
                WorkspaceController wc = new WorkspaceController();

                wc.setLangDefFilePath(langDefFilePath);

                wc.loadFreshWorkspace();
                createAndShowGUI(wc);
            }
        });
    }

    // function to generate C code for various blocks.
    public String generateCode(Block block) {
        String NL = System.getProperty("line.separator");
        String str = "";
        
        /*
        if (block.getGenusName().equals("runforsometime")) {
            StringBuilder sb = new StringBuilder("while(1){");

            Iterator it = block.getSockets().iterator();
            while (it.hasNext()) {
                BlockConnector bc = (BlockConnector) it.next();
                sb.append(this.generateCode(this.getByID(bc.getBlockID())));
            }
            sb.append("}");
            return sb.toString();

        }
        */
        
        if (block.getGenusName().equals("procedure")) {
            StringBuilder sb = new StringBuilder("");
            sb.append(NL).append("void ").append(block.getBlockLabel()).append(" () {").append(NL);
            sb.append(this.generateCode(this.getByID(block.getAfterConnector().getBlockID())));
            sb.append("\n}\n");
            return sb.toString();
        }
        
        if (block.getGenusName().equals("caller")) {
            StringBuilder sb = new StringBuilder("");
            sb.append(block.getBlockLabel()).append("();");
            sb.append(this.generateCode(this.getByID(block.getAfterConnector().getBlockID())));
            return sb.toString();
        }
        
        if(block.getGenusName().equals("xbee"))
        {
            StringBuilder sb = new StringBuilder("");
            sb.append(NL).append("unsigned char data;").append(NL);
            sb.append("SIGNAL(SIG_USART0_RECV)").append(NL);
            sb.append("{").append(NL);
            sb.append(" data = UDR0;\n ");
            for (BlockConnector bc : block.getSockets()) {
                sb.append(this.generateCode(this.getByID(bc.getBlockID())));
                sb.append(NL).append(" ");
            }
            sb.append(NL).append("}").append(NL);
            
            return sb.toString();
        }
        
        
        if(block.getGenusName().equals("recvd-data"))
        {
            StringBuilder sb = new StringBuilder("");
            sb.append("data");
            return sb.toString();
        }
        
        if(block.getGenusName().equals("char"))
        {
            StringBuilder sb = new StringBuilder("");
            sb.append("'").append(block.getBlockLabel()).append("'");
            return sb.toString();
        }
        
        if(block.getGenusName().equals("string"))
        {
            StringBuilder sb = new StringBuilder("");
            sb.append("\"").append(block.getBlockLabel()).append("\"");
            return sb.toString();
        }
        
        if(block.getGenusName().equals("stop"))
        {
            StringBuilder sb = new StringBuilder("STOP();");
            return sb.toString();
        }
        
        if(block.getGenusName().equals("empty"))
        {
            StringBuilder sb = new StringBuilder("");
            return sb.toString();
        }
        
        if (block.getGenusName().equals("forever")) {
            StringBuilder sb = new StringBuilder("while(1){");
            for (BlockConnector bc : block.getSockets()) {
                sb.append(this.generateCode(this.getByID(bc.getBlockID())));
                sb.append(NL).append(" ");
            }
            sb.append(NL).append(" count++;").append(NL);
            sb.append(" }");
            return sb.toString();

        }
        if (block.getGenusName().equals("if")) {
            StringBuilder sb = new StringBuilder("if(");
            Iterator it = block.getSockets().iterator();
            while (it.hasNext()) {
                BlockConnector bc = (BlockConnector) it.next();
                Block condition = this.getByID(bc.getBlockID());
                Block command = null;
                try {

                    bc = (BlockConnector) it.next();
                    command = this.getByID(bc.getBlockID());

                } catch (Exception ex) {
                }

                if (condition.isCommandBlock()) {
                    Block temp = command;
                    command = condition;
                    condition = temp;
                }
                sb.append(this.generateCode(condition));
                sb.append("){");
                sb.append(NL).append(" ");
                sb.append(this.generateCode(command));
                sb.append(NL).append(" ");
                sb.append("}");

            }
            try {
                if (block.getAfterBlockID() != null && block.getAfterBlockID() != -1) {
                    System.out.println(block.getAfterBlockID());
                    sb.append(this.generateCode(this.getByID(block.getAfterBlockID())));
                } else {
                }
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
            }
            return sb.toString();
        }
        
        if (block.getGenusName().equals("ifelse")) {
            StringBuilder sb = new StringBuilder("if(");
            Iterator it = block.getSockets().iterator();
            while (it.hasNext()) {
                BlockConnector bc = (BlockConnector) it.next();
                Block condition = this.getByID(bc.getBlockID());
                Block command = null;
                Block elsecommand = null;
                try {

                    bc = (BlockConnector) it.next();
                    command = this.getByID(bc.getBlockID());

                } catch (Exception ex) {
                }
                
                try {

                    bc = (BlockConnector) it.next();
                    elsecommand = this.getByID(bc.getBlockID());

                } catch (Exception ex) {
                }

                if (condition.isCommandBlock()) {
                    Block temp = command;
                    command = condition;
                    condition = temp;
                }
                sb.append(this.generateCode(condition));
                sb.append("){");
                sb.append(NL).append(" ");
                sb.append(this.generateCode(command));
                sb.append(NL).append(" ");
                sb.append("}");
                sb.append(" else{");
                sb.append(NL).append(" ");
                sb.append(this.generateCode(elsecommand));
                sb.append(NL).append(" ");
                sb.append("}");

            }
            try {
                if (block.getAfterBlockID() != null && block.getAfterBlockID() != -1) {
                    System.out.println(block.getAfterBlockID());
                    sb.append(this.generateCode(this.getByID(block.getAfterBlockID())));
                } else {
                }
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
            }
            return sb.toString();
        }
        

        if (block.getGenusName().equals("repeat")) {
            StringBuilder sb = new StringBuilder("if(");
            Iterator it = block.getSockets().iterator();
            while (it.hasNext()) {
                BlockConnector bc = (BlockConnector) it.next();
                Block condition = this.getByID(bc.getBlockID());
                Block command = null;
                Block elsecommand = null;
                try {

                    bc = (BlockConnector) it.next();
                    command = this.getByID(bc.getBlockID());

                } catch (Exception ex) {
                }
                
                try {

                    bc = (BlockConnector) it.next();
                    elsecommand = this.getByID(bc.getBlockID());

                } catch (Exception ex) {
                }

                if (condition.isCommandBlock()) {
                    Block temp = command;
                    command = condition;
                    condition = temp;
                }
                sb.append(this.generateCode(condition));
                sb.append("){");
                sb.append(this.generateCode(command));
                sb.append("}");
                sb.append(" else{");
                sb.append(this.generateCode(elsecommand));
                sb.append("}");

            }
            try {
                if (block.getAfterBlockID() != null && block.getAfterBlockID() != -1) {
                    System.out.println(block.getAfterBlockID());
                    sb.append(this.generateCode(this.getByID(block.getAfterBlockID())));
                } else {
                }
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
            }
            return sb.toString();
        }

        if (block.getGenusName().equals("lcd")) {
            StringBuilder sb = new StringBuilder("lcd_cursor(");
            int i=1;
           // StringBuilder sb_temp = new StringBuilder("lcd_string(");
            for (BlockConnector bc : block.getSockets()) {
                Block display_text = this.getByID(bc.getBlockID());                

                    if (bc.getBlockID() != null && bc.getBlockID() != -1) {
                        sb.append(this.generateCode(display_text));
                    }
                if(i==1){
                    sb.append(",");
                }
                else if(i==2){
                    sb.append(");lcd_string(");
                }
                else{
                    sb.append(");");
                }
                i++;
            }
            try {
                if (block.getAfterBlockID() != null && block.getAfterBlockID() != -1) {
                    System.out.println(block.getAfterBlockID());
                    sb.append(this.generateCode(this.getByID(block.getAfterBlockID())));
                } else {
                }
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
            }
            return sb.toString();
        }
        
        if (block.getGenusName().equals("lcdnum")) {
            StringBuilder sb = new StringBuilder("lcd_cursor(");
            int i=1;
           // StringBuilder sb_temp = new StringBuilder("lcd_string(");
            for (BlockConnector bc : block.getSockets()) {
                Block display_text = this.getByID(bc.getBlockID());                

                    if (bc.getBlockID() != null && bc.getBlockID() != -1) {
                        sb.append(this.generateCode(display_text));
                    }
                if(i==1){
                    sb.append(",");
                }
                else if(i==2){
                    sb.append(");lcd_print1(");
                }
                else{
                    sb.append(",4);");
                }
                i++;
            }
            try {
                if (block.getAfterBlockID() != null && block.getAfterBlockID() != -1) {
                    System.out.println(block.getAfterBlockID());
                    sb.append(this.generateCode(this.getByID(block.getAfterBlockID())));
                } else {
                }
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
            }
            return sb.toString();
        }
        
        if (block.getGenusName().equals("URS")) {
            StringBuilder sb = new StringBuilder("ultraSonicRangeSensor()");
            /*int i=1;
            for (BlockConnector bc : block.getSockets()) {
                Block display_text = this.getByID(bc.getBlockID());                

                    if (bc.getBlockID() != null && bc.getBlockID() != -1) {
                        sb.append(this.generateCode(display_text));
                    }
                if(i==1){
                    sb.append(",");
                }
                else{
                    sb.append(");");
                }
                i++;
            }
            try {
                if (block.getAfterBlockID() != null && block.getAfterBlockID() != -1) {
                    System.out.println(block.getAfterBlockID());
                    sb.append(this.generateCode(this.getByID(block.getAfterBlockID())));
                } else {
                }
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
            }*/
            return sb.toString();
        }
        
        //incomplete
        if (block.getGenusName().equals("decl")) {
            StringBuilder sb = new StringBuilder("int ");
            for (BlockConnector bc : block.getSockets()) {
                Block speed = this.getByID(bc.getBlockID());
                
                
                if (bc.getBlockID() != null && bc.getBlockID() != -1) {
                    sb.append(this.generateCode(speed));
                }

                sb.append(";");
            }
            try {
                if (block.getAfterBlockID() != null && block.getAfterBlockID() != -1) {
                    System.out.println(block.getAfterBlockID());
                    sb.append(this.generateCode(this.getByID(block.getAfterBlockID())));
                } else {
                }
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
            }
            return sb.toString();
        }
        
        if (block.getGenusName().equals("fd")) {
            StringBuilder sb = new StringBuilder("move_forward(");
            for (BlockConnector bc : block.getSockets()) {
                Block speed = this.getByID(bc.getBlockID());
                
                
                if (bc.getBlockID() != null && bc.getBlockID() != -1) {
                    sb.append(this.generateCode(speed));
                }

                sb.append(");");
            }
            try {
                if (block.getAfterBlockID() != null && block.getAfterBlockID() != -1) {
                    System.out.println(block.getAfterBlockID());
                    sb.append(this.generateCode(this.getByID(block.getAfterBlockID())));
                } else {
                }
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
            }
            return sb.toString();
        }


        if (block.getGenusName().equals("bk")) {
            StringBuilder sb = new StringBuilder("move_backward(");
            for (BlockConnector bc : block.getSockets()) {
                Block condition = this.getByID(bc.getBlockID());
                
                
                if (bc.getBlockID() != null && bc.getBlockID() != -1) {
                    sb.append(this.generateCode(condition));
                }

                sb.append(");");
            }
            try {
                if (block.getAfterBlockID() != null && block.getAfterBlockID() != -1) {
                    System.out.println(block.getAfterBlockID());
                    sb.append(this.generateCode(this.getByID(block.getAfterBlockID())));
                } else {
                }
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
            }
            return sb.toString();
        }

        if (block.getGenusName().equals("left-fd")) {
            StringBuilder sb = new StringBuilder("move_forward_left(");
            for (BlockConnector bc : block.getSockets()) {
                Block condition = this.getByID(bc.getBlockID());
                
                
                if (bc.getBlockID() != null && bc.getBlockID() != -1) {
                    sb.append(this.generateCode(condition));
                }

                sb.append(");");
            }
            try {
                if (block.getAfterBlockID() != null && block.getAfterBlockID() != -1) {
                    System.out.println(block.getAfterBlockID());
                    sb.append(this.generateCode(this.getByID(block.getAfterBlockID())));
                } else {
                }
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
            }
            return sb.toString();
        }

        if (block.getGenusName().equals("right-fd")) {
            StringBuilder sb = new StringBuilder("move_forward_right(");
            for (BlockConnector bc : block.getSockets()) {
                Block condition = this.getByID(bc.getBlockID());
                
                
                if (bc.getBlockID() != null && bc.getBlockID() != -1) {
                    sb.append(this.generateCode(condition));
                }

                sb.append(");");
            }
            try {
                if (block.getAfterBlockID() != null && block.getAfterBlockID() != -1) {
                    System.out.println(block.getAfterBlockID());
                    sb.append(this.generateCode(this.getByID(block.getAfterBlockID())));
                } else {
                }
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
            }
            return sb.toString();
        }
        if (block.getGenusName().equals("buzzer")) {
            StringBuilder sb = new StringBuilder("buzzer(");
            for (BlockConnector bc : block.getSockets()) {
                Block condition = this.getByID(bc.getBlockID());
                
                
                if (bc.getBlockID() != null && bc.getBlockID() != -1) {
                    sb.append(this.generateCode(condition));
                }

                sb.append(");");
            }
            try {
                if (block.getAfterBlockID() != null && block.getAfterBlockID() != -1) {
                    System.out.println(block.getAfterBlockID());
                    sb.append(this.generateCode(this.getByID(block.getAfterBlockID())));
                } else {
                }
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
            }
            return sb.toString();
        }
        
        
        if (block.getGenusName().equals("assign")) {
            StringBuilder sb = new StringBuilder("");
            Iterator it = block.getSockets().iterator();
            while (it.hasNext()) {
                BlockConnector bc = (BlockConnector) it.next();
                Block left = this.getByID(bc.getBlockID());
                sb.append(this.generateCode(left));
                Block right = null;
                try {
                    bc = (BlockConnector) it.next();
                    right = this.getByID(bc.getBlockID());
                    sb.append(" = ").append(this.generateCode(right));
                } catch (Exception Ex) {
                }
                //sb.append(")");
            }
            return sb.toString();
        }

        if (block.getGenusName().equals("number")) {
            if (block.getBlockLabel() == null || block.getBlockLabel().equals("")) {
                return "1";
            } else {
                return block.getBlockLabel();
            }
        }
        if (block.getGenusName().equals("and")) {
            StringBuilder sb = new StringBuilder("(");
            Iterator it = block.getSockets().iterator();
            while (it.hasNext()) {
                BlockConnector bc = (BlockConnector) it.next();
                Block left = this.getByID(bc.getBlockID());
                sb.append(this.generateCode(left));
                Block right = null;
                try {
                    bc = (BlockConnector) it.next();
                    right = this.getByID(bc.getBlockID());
                    sb.append(" && ").append(this.generateCode(right));
                } catch (Exception Ex) {
                }
                sb.append(")");
            }
            return sb.toString();
        }

        if (block.getGenusName().equals("or")) {
            StringBuilder sb = new StringBuilder("(");
            Iterator it = block.getSockets().iterator();
            while (it.hasNext()) {
                BlockConnector bc = (BlockConnector) it.next();
                Block left = this.getByID(bc.getBlockID());
                sb.append(this.generateCode(left));
                Block right = null;
                try {
                    bc = (BlockConnector) it.next();
                    right = this.getByID(bc.getBlockID());
                    sb.append(" || ").append(this.generateCode(right));
                } catch (Exception Ex) {
                }
                sb.append(")");
            }
            return sb.toString();
        }

        if (block.getGenusName().equals("lessthan")) {
            StringBuilder sb = new StringBuilder("(");
            Iterator it = block.getSockets().iterator();
            while (it.hasNext()) {
                BlockConnector bc = (BlockConnector) it.next();
                Block left = this.getByID(bc.getBlockID());
                sb.append(this.generateCode(left));
                Block right = null;
                try {
                    bc = (BlockConnector) it.next();
                    right = this.getByID(bc.getBlockID());
                    sb.append(" < ").append(this.generateCode(right));
                } catch (Exception Ex) {
                }
                sb.append(")");
            }
            return sb.toString();
        }

        if (block.getGenusName().equals("greaterthan")) {
            StringBuilder sb = new StringBuilder("(");
            Iterator it = block.getSockets().iterator();
            while (it.hasNext()) {
                BlockConnector bc = (BlockConnector) it.next();
                Block left = this.getByID(bc.getBlockID());
                sb.append(this.generateCode(left));
                Block right = null;
                try {
                    bc = (BlockConnector) it.next();
                    right = this.getByID(bc.getBlockID());
                    sb.append(" > ").append(this.generateCode(right));
                } catch (Exception Ex) {
                }
                sb.append(")");
            }
            return sb.toString();
        }

        if (block.getGenusName().equals("lessthanorequalto")) {
            StringBuilder sb = new StringBuilder("(");
            Iterator it = block.getSockets().iterator();
            while (it.hasNext()) {
                BlockConnector bc = (BlockConnector) it.next();
                Block left = this.getByID(bc.getBlockID());
                sb.append(this.generateCode(left));
                Block right = null;
                try {
                    bc = (BlockConnector) it.next();
                    right = this.getByID(bc.getBlockID());
                    sb.append(" <= ").append(this.generateCode(right));
                } catch (Exception Ex) {
                }
                sb.append(")");
            }
            return sb.toString();
        }
        if (block.getGenusName().equals("greaterthanorequalto")) {
            StringBuilder sb = new StringBuilder("(");
            Iterator it = block.getSockets().iterator();
            while (it.hasNext()) {
                BlockConnector bc = (BlockConnector) it.next();
                Block left = this.getByID(bc.getBlockID());
                sb.append(this.generateCode(left));
                Block right = null;
                try {
                    bc = (BlockConnector) it.next();
                    right = this.getByID(bc.getBlockID());
                    sb.append(" >= ").append(this.generateCode(right));
                } catch (Exception Ex) {
                }
                sb.append(")");
            }
            return sb.toString();
        }

        if (block.getGenusName().equals("equals")) {
            StringBuilder sb = new StringBuilder("");
            Iterator it = block.getSockets().iterator();
            while (it.hasNext()) {
                BlockConnector bc = (BlockConnector) it.next();
                Block left = this.getByID(bc.getBlockID());
                sb.append(this.generateCode(left));
                Block right = null;
                try {
                    bc = (BlockConnector) it.next();
                    right = this.getByID(bc.getBlockID());
                    sb.append(" == ").append(this.generateCode(right));
                } catch (Exception Ex) {
                }
                //sb.append(")");
            }
            return sb.toString();
        }
        
        if (block.getGenusName().equals("strequals")) {
            StringBuilder sb = new StringBuilder("");
            Iterator it = block.getSockets().iterator();
            while (it.hasNext()) {
                BlockConnector bc = (BlockConnector) it.next();
                Block left = this.getByID(bc.getBlockID());
                sb.append(this.generateCode(left));
                Block right = null;
                try {
                    bc = (BlockConnector) it.next();
                    right = this.getByID(bc.getBlockID());
                    sb.append(" == ").append(this.generateCode(right));
                } catch (Exception Ex) {
                }
                //sb.append(")");
            }
            return sb.toString();
        }
        
        
        if (block.getGenusName().equals("charequals")) {
            StringBuilder sb = new StringBuilder("");
            Iterator it = block.getSockets().iterator();
            while (it.hasNext()) {
                BlockConnector bc = (BlockConnector) it.next();
                Block left = this.getByID(bc.getBlockID());
                sb.append(this.generateCode(left));
                Block right = null;
                try {
                    bc = (BlockConnector) it.next();
                    right = this.getByID(bc.getBlockID());
                    sb.append(" == ").append(this.generateCode(right));
                } catch (Exception Ex) {
                }
                //sb.append(")");
            }
            return sb.toString();
        }
        
        
        if (block.getGenusName().equals("numequals")) {
            StringBuilder sb = new StringBuilder("");
            Iterator it = block.getSockets().iterator();
            while (it.hasNext()) {
                BlockConnector bc = (BlockConnector) it.next();
                Block left = this.getByID(bc.getBlockID());
                sb.append(this.generateCode(left));
                Block right = null;
                try {
                    bc = (BlockConnector) it.next();
                    right = this.getByID(bc.getBlockID());
                    sb.append(" == ").append(this.generateCode(right));
                } catch (Exception Ex) {
                }
                //sb.append(")");
            }
            return sb.toString();
        }

        if (block.getGenusName().equals("notequals")) {
            StringBuilder sb = new StringBuilder("(");
            Iterator it = block.getSockets().iterator();
            while (it.hasNext()) {
                BlockConnector bc = (BlockConnector) it.next();
                Block left = this.getByID(bc.getBlockID());
                sb.append(this.generateCode(left));
                Block right = null;
                try {
                    bc = (BlockConnector) it.next();
                    right = this.getByID(bc.getBlockID());
                    sb.append(" != ").append(this.generateCode(right));
                } catch (Exception Ex) {
                }
                sb.append(")");
            }
            return sb.toString();
        }

        if (block.getGenusName().equals("white-line-right")) {
            return "white_line_right()";
        }
        if (block.getGenusName().equals("white-line-middle")) {
            return "white_line_middle()";
        }
        if (block.getGenusName().equals("white-line-left")) {
            return "white_line_left()";
        }
        if (block.getGenusName().equals("front-IR")) {
            return "front_IR()";
        }
        if (block.getGenusName().equals("e")) {
            return "7";
        }
        if (block.getGenusName().equals("pi")) {
            return "10";
        }
        if (block.getGenusName().equals("true")) {
            return "1";
        }
        if (block.getGenusName().equals("false")) {
            return "0";
         }


        return "";

    }

    public Block getByID(long id) {
        Page page = workspace.getPageNamed("Runtime");
        Collection allBlocks = page.getBlocks();
        Iterator it = allBlocks.iterator();
        while (it.hasNext()) {
            RenderableBlock bc = (RenderableBlock) it.next();
            if (bc.getBlockID() == id) {
                return bc.getBlock();
            }
        }
        return null;
    }
}


/*
if(block.getGenusName().equals("xbee"))
        {
            StringBuilder sb = new StringBuilder("");
            sb.append(NL).append("SIGNAL(SIG_USART0_RECV)").append(NL);
            sb.append("{").append(NL);
            sb.append(" data = UDR0; 				//making copy of data from UDR0 in 'data' variable \n" +
"\n" +
"	UDR0 = data; 				//echo data back to PC\n" +
"\n" +
"	if(data == 0x38) //ASCII value of 8\n" +
"	{\n" +
"		PORTA=0x06;  //forward\n" +
"	}\n" +
"\n" +
"	if(data == 0x32) //ASCII value of 2\n" +
"	{\n" +
"		PORTA=0x09; //back\n" +
"	}\n" +
"\n" +
"	if(data == 0x34) //ASCII value of 4\n" +
"	{\n" +
"		PORTA=0x05;  //left\n" +
"	}\n" +
"\n" +
"	if(data == 0x36) //ASCII value of 6\n" +
"	{\n" +
"		PORTA=0x0A; //right\n" +
"	}\n" +
"\n" +
"	if(data == 0x35) //ASCII value of 5\n" +
"	{\n" +
"		PORTA=0x00; //stop\n" +
"	}\n" +
"\n" +
"	if(data == 0x37) //ASCII value of 7\n" +
"	{\n" +
"		buzzer_on();\n" +
"	}\n" +
"\n" +
"	if(data == 0x39) //ASCII value of 9\n" +
"	{\n" +
"		buzzer_off();\n" +
"	}");
            sb.append(NL).append("}").append(NL);
            
            return sb.toString();
        }
*/