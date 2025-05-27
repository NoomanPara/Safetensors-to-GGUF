import gradio as gr
import subprocess
import os

# Config
CONVERT_SCRIPT = "convert.py"
LLAMA_QUANT_BIN = "llama.cpp/build/bin/Debug/llama-quantize.exe"
OUTPUT_DIR = "outputs"
os.makedirs(OUTPUT_DIR, exist_ok=True)

# --- Tab 1: Convert to GGUF ---
def convert_to_gguf(input_path):
    if not os.path.exists(input_path):
        return f"[❌ Error] File not found: {input_path}", None

    base_name = os.path.splitext(os.path.basename(input_path))[0]
    gguf_path = os.path.join(OUTPUT_DIR, f"{base_name}.gguf")

    convert_cmd = ["python", CONVERT_SCRIPT, "--src", input_path, "--dst", gguf_path]
    try:
        subprocess.run(convert_cmd, check=True)
    except subprocess.CalledProcessError as e:
        return f"[❌ Conversion Failed] {e}", None

    if not os.path.exists(gguf_path):
        return "[❌ Error] GGUF file not created.", None

    return f"✅ Converted to GGUF: {gguf_path}", gguf_path

# --- Tab 2: Quantize GGUF ---
def quantize_gguf(gguf_path, quant_type):
    if not os.path.exists(gguf_path):
        return f"[❌ Error] GGUF file not found: {gguf_path}", None

    base_name = os.path.splitext(os.path.basename(gguf_path))[0]
    quant_path = os.path.join(OUTPUT_DIR, f"{base_name}-{quant_type}.gguf")

    quant_cmd = [LLAMA_QUANT_BIN, gguf_path, quant_path, quant_type]
    try:
        subprocess.run(quant_cmd, check=True)
    except subprocess.CalledProcessError as e:
        return f"[❌ Quantization Failed] {e}", None

    return f"✅ Quantized to: {quant_path}", quant_path

# --- Gradio App Layout ---
with gr.Blocks(title="GGUF Converter & Quantizer") as demo:
    gr.Markdown("## 🧠 GGUF Image Model Converter & Quantizer")

    with gr.Tab("1️⃣ Convert to GGUF"):
        safetensors_input = gr.Textbox(label="Path to .safetensors File")
        convert_btn = gr.Button("Convert")
        convert_status = gr.Textbox(label="Status")
        convert_output = gr.File(label="Converted GGUF")
        convert_btn.click(convert_to_gguf, inputs=safetensors_input, outputs=[convert_status, convert_output])

    with gr.Tab("2️⃣ Quantize GGUF"):
        gguf_input = gr.Textbox(label="Path to .gguf File")
        quant_type_input = gr.Dropdown(["Q4_K_S", "Q5_1", "Q8_0", "Q2_K"], value="Q4_K_S", label="Quantization Type")
        quantize_btn = gr.Button("Quantize")
        quant_status = gr.Textbox(label="Status")
        quant_output = gr.File(label="Quantized GGUF")
        quantize_btn.click(quantize_gguf, inputs=[gguf_input, quant_type_input], outputs=[quant_status, quant_output])

demo.launch(inbrowser=True)
