public class MatrixParser {

    
    public List<String> destination_addresses { get; set; }
    public List<String> origin_addresses { get; set; }
    public List<Row> rows { get; set; }
    public String status { get; set; }

    public class Row {
        public List<Element> elements { get; set; }
    }

    public class Element {
        public Distance distance { get; set; }
        public Duration duration { get; set; }
        public String origin { get; set; }
        public String destination { get; set; }
        public String status { get; set; }
    }

    public class Distance {
        public String text { get; set; }
        public Integer value { get; set; }
    }

    public class Duration {
        public String text { get; set; }
        public Integer value { get; set; }
    }



}