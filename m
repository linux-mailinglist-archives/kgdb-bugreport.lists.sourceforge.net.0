Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A97761A4C2E
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 11 Apr 2020 00:43:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jN2MW-0002B6-EF
	for lists+kgdb-bugreport@lfdr.de; Fri, 10 Apr 2020 22:43:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jN2MT-0002Ay-Vk
 for kgdb-bugreport@lists.sourceforge.net; Fri, 10 Apr 2020 22:42:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PDySh9LWSYaxL8uCUBY+B51ZCoRzLjU7ny3rtZ5WpyI=; b=k3+yHLnOOkaapD3t1nIOBBc5cs
 RwGM6R8NzKftAOub/52hMvkigWjGr5LVZX4tHEhJRvJ1r97JO/WbZMPc9LgNN5fDaJKOOMI0ysa6Z
 u/4ggq5Z6MLxVZiwVir3/ZP30P1S2txZ4D1bIsui6jSO/QRwj0EfSDr9KMUUfrmgwvx0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PDySh9LWSYaxL8uCUBY+B51ZCoRzLjU7ny3rtZ5WpyI=; b=LSnhBx2V9dryd3dIpraZAlt+FT
 kQCawxKQZAqVYgMhkvGdJjjH4EmRilQXv2yyY43tqoxfKHXwwusvqAjOaGuSC6V84G+nt5FrVnibj
 6nhL/K0DWfKIjagY82rUV8mDPBXEuFklLJmSXVOx/xvcgkH+VIZpLFShkgfEL/ctphj4=;
Received: from mail-io1-f66.google.com ([209.85.166.66])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jN2MP-00B3kJ-JL
 for kgdb-bugreport@lists.sourceforge.net; Fri, 10 Apr 2020 22:42:57 +0000
Received: by mail-io1-f66.google.com with SMTP id m4so3243375ioq.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 10 Apr 2020 15:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PDySh9LWSYaxL8uCUBY+B51ZCoRzLjU7ny3rtZ5WpyI=;
 b=kTNmL3Zc4rUnR8jhyMD6kS7nLOm+87Zz3ZdvIDzkYabQO9jCPXPbIS+o1xSHqHQD8F
 +RC7x+Jc9cze9VfxpkTubOw55NRdZd7cTmINA07JgTBLznRaCtvmPL58QcezHPv6+w4S
 zEP4Kj9rcQkNDBw688MoG0arZZndzwE+edZDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PDySh9LWSYaxL8uCUBY+B51ZCoRzLjU7ny3rtZ5WpyI=;
 b=LQJJcPjeV3/9Ob7H6PXzQizV1gLySmXXuduOvUQEuc16i1BiWXmF4PyAsHLW8js/tu
 0qu4/91Cer0Mzhj5GhycEgiIQ0WPYh87cLv4/44+kN8rqx46IJgMbbuikpAQpKTWfmSW
 eiLUAxzBvXHJNfw66SmNYvJPJ+OoTGLF8gu5uR7UQm5HywbxvgpM3EcDuac2rAVqPv5n
 FGa7VVWCbuUBm+LfT7jWInvZWdERop8kluIZk6T9xnJwtrycx7iNtgtGsLWoJ09ihAKr
 DmXKwXcV62pP719oSPyp8jAHE+xA73lkDc26mcpeZjGJ5wkJIU66vd+bb69wo83AaO84
 DI+g==
X-Gm-Message-State: AGi0Pua+RBmaRhWW0AJNTE7cRmZho2L1h8eBqG1efcXMi4ZEDhtshfEU
 T4hzLrAU/Tv7NJd9tnEignccWbBenfj4jA==
X-Google-Smtp-Source: APiQypJqnQrXOSYLc8xfrGjUwbaZUZKZQmllgHDzAQmyi+/TOLfvgvfoXcarJOR6YbaX9+ReCgsjkw==
X-Received: by 2002:a63:e909:: with SMTP id i9mr6411527pgh.370.1586557104598; 
 Fri, 10 Apr 2020 15:18:24 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id x2sm2646600pfq.92.2020.04.10.15.18.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2020 15:18:24 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: jason.wessel@windriver.com, daniel.thompson@linaro.org,
 gregkh@linuxfoundation.org
Date: Fri, 10 Apr 2020 15:17:23 -0700
Message-Id: <20200410151632.4.I8fba5961bf452ab92350654aa61957f23ecf0100@changeid>
X-Mailer: git-send-email 2.26.0.110.g2183baf09c-goog
In-Reply-To: <20200410221726.36442-1-dianders@chromium.org>
References: <20200410221726.36442-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.66 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jN2MP-00B3kJ-JL
Subject: [Kgdb-bugreport] [PATCH 4/7] kgdboc: Add earlycon_kgdboc to support
 early kgdb using boot consoles
X-BeenThere: kgdb-bugreport@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: kgdb bugs suggestions <kgdb-bugreport.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=kgdb-bugreport>
List-Post: <mailto:kgdb-bugreport@lists.sourceforge.net>
List-Help: <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=subscribe>
Cc: catalin.marinas@arm.com, will@kernel.org, corbet@lwn.net,
 kgdb-bugreport@lists.sourceforge.net, hpa@zytor.com, agross@kernel.org,
 bjorn.andersson@linaro.org, mingo@redhat.com, bp@alien8.de,
 linux-serial@vger.kernel.org, jslaby@suse.com, tglx@linutronix.de,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

We want to enable kgdb to debug the early parts of the kernel.
Unfortunately kgdb normally is a client of the tty API in the kernel
and serial drivers don't register to the tty layer until fairly late
in the boot process.

Serial drivers do, however, commonly register a boot console.  Let's
enable the kgdboc driver to work with boot consoles to provide early
debugging.

This change co-opts the existing read() function pointer that's part
of "struct console".  It's assumed that if a boot console (with the
flag CON_BOOT) has implemented read() that both the read() and write()
function are polling functions.  That means they work without
interrupts and read() will return immediately (with 0 bytes read) if
there's nothing to read.  This should be a safe assumption since it
appears that no current boot consoles implement read() right now and
there seems no reason to do so unless they wanted to support
"earlycon_kgdboc".

The console API isn't really intended to have clients work with it
like we're doing.  Specifically there doesn't appear to be any way for
clients to be notified about a boot console being unregistered.  We'll
work around this by checking that our console is still valid before
using it.  We'll also try to transition off of the boot console and
onto the "tty" API as quickly as possible.

The normal/expected way to make all this work is to use
"earlycon_kgdboc" and "kgdboc" together.  You should point them both
to the same physical serial connection.  At boot time, as the system
transitions from the boot console to the normal console, kgdb will
switch over.  If you don't use things in the normal/expected way it's
a bit of a buyer-beware situation.  Things thought about:

- If you specify only "earlycon_kgdboc" but not "kgdboc" you still
  might end up dropping into kgdb upon a crash/sysrq but you may not
  be able to type.
- If you use "keep_bootcon" (which is already a bit of a buyer-beware
  option) and specify "earlycon_kgdboc" but not "kgdboc" we'll keep
  trying to use your boot console for kgdb.
- If your "earlycon_kgdboc" and "kgdboc" devices are not the same
  device things should work OK, but it'll be your job to switch over
  which device you're monitoring (including figuring out how to switch
  over gdb in-flight if you're using it).

When trying to enable "earlycon_kgdboc" it should be noted that the
names that are registered through the boot console layer and the tty
layer are not the same for the same port.  For example when debugging
on one board I'd need to pass "earlycon_kgdboc=qcom_geni
kgdboc=ttyMSM0" to enable things properly.  Since digging up the boot
console name is a pain and there will rarely be more than one boot
console enabled, you can provide the "earlycon_kgdboc" parameter
without specifying the name of the boot console.  In this case we'll
just pick the first boot that implements read() that we find.

This new "earlycon_kgdboc" parameter should be contrasted to the
existing "ekgdboc" parameter.  While both provide a way to debug very
early, the usage and mechanisms are quite different.  Specifically
"earlycon_kgdboc" is meant to be used in tandem with "kgdboc" and
there is a transition from one to the other.  The "ekgdboc" parameter,
on the other hand, replaces the "kgdboc" parameter.  It runs the same
logic as the "kgdboc" parameter but just relies on your TTY driver
being present super early.  The only known usage of the old "ekgdboc"
parameter is documented as "ekgdboc=kbd earlyprintk=vga".  It should
be noted that "kbd" has special treatment allowing it to init early as
a tty device.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/tty/serial/kgdboc.c | 140 +++++++++++++++++++++++++++++++++++-
 include/linux/kgdb.h        |   3 +-
 kernel/debug/debug_core.c   |  15 +++-
 3 files changed, 154 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
index 9ace39fc4f95..47cd0c28a0f6 100644
--- a/drivers/tty/serial/kgdboc.c
+++ b/drivers/tty/serial/kgdboc.c
@@ -21,6 +21,7 @@
 #include <linux/input.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/serial_core.h>
 
 #define MAX_CONFIG_LEN		40
 
@@ -42,6 +43,14 @@ static int			kgdb_tty_line;
 
 static struct platform_device *kgdboc_pdev;
 
+#ifdef CONFIG_KGDB_SERIAL_CONSOLE
+static struct kgdb_io		earlycon_kgdboc_io_ops;
+struct console			*earlycon;
+bool				earlycon_neutered;
+#else /* ! CONFIG_KGDB_SERIAL_CONSOLE */
+#define earlycon NULL
+#endif /* ! CONFIG_KGDB_SERIAL_CONSOLE */
+
 #ifdef CONFIG_KDB_KEYBOARD
 static int kgdboc_reset_connect(struct input_handler *handler,
 				struct input_dev *dev,
@@ -135,8 +144,46 @@ static void kgdboc_unregister_kbd(void)
 #define kgdboc_restore_input()
 #endif /* ! CONFIG_KDB_KEYBOARD */
 
+#ifdef CONFIG_KGDB_SERIAL_CONSOLE
+
+static void cleanup_earlycon(bool unregister)
+{
+	if (earlycon && unregister)
+		kgdb_unregister_io_module(&earlycon_kgdboc_io_ops);
+	earlycon = NULL;
+}
+
+static bool is_earlycon_still_valid(void)
+{
+	struct console *con;
+
+	for_each_console(con)
+		if (con == earlycon)
+			return true;
+	return false;
+}
+
+static void cleanup_earlycon_if_invalid(void)
+{
+	console_lock();
+	if (earlycon && (earlycon_neutered || !is_earlycon_still_valid())) {
+		pr_warn("earlycon vanished; unregistering\n");
+		cleanup_earlycon(true);
+	}
+	console_unlock();
+}
+
+#else /* ! CONFIG_KGDB_SERIAL_CONSOLE */
+
+static inline void cleanup_earlycon(bool unregister) { ; }
+static inline void cleanup_earlycon_if_invalid(void) { ; }
+
+#endif /* ! CONFIG_KGDB_SERIAL_CONSOLE */
+
 static void cleanup_kgdboc(void)
 {
+	cleanup_earlycon(true);
+
 	if (configured != 1)
 		return;
 
@@ -190,9 +237,10 @@ static int configure_kgdboc(void)
 	kgdb_tty_line = tty_line;
 
 do_register:
-	err = kgdb_register_io_module(&kgdboc_io_ops);
+	err = kgdb_register_io_module(&kgdboc_io_ops, earlycon != NULL);
 	if (err)
 		goto noconfig;
+	cleanup_earlycon(false);
 
 	err = kgdb_register_nmi_console();
 	if (err)
@@ -208,6 +256,14 @@ static int configure_kgdboc(void)
 	kgdboc_unregister_kbd();
 	configured = 0;
 
+	/*
+	 * Each time we run configure_kgdboc() but don't find a console, use
+	 * that as a chance to validate that our earlycon didn't vanish on
+	 * us.  If it vanished we should unregister which will disable kgdb
+	 * if we're the last I/O module.
+	 */
+	cleanup_earlycon_if_invalid();
+
 	return err;
 }
 
@@ -415,6 +471,88 @@ static int __init kgdboc_early_init(char *opt)
 }
 
 early_param("ekgdboc", kgdboc_early_init);
+
+static int earlycon_kgdboc_get_char(void)
+{
+	char c;
+
+	if (earlycon_neutered || !earlycon->read(earlycon, &c, 1))
+		return NO_POLL_CHAR;
+
+	return c;
+}
+
+static void earlycon_kgdboc_put_char(u8 chr)
+{
+	if (!earlycon_neutered)
+		earlycon->write(earlycon, &chr, 1);
+}
+
+static void earlycon_kgdboc_pre_exp_handler(void)
+{
+	atomic_inc(&ignore_console_lock_warning);
+
+	/*
+	 * We don't get notified when the boot console is unregistered.
+	 * Double-check when we enter the debugger.  Unfortunately we
+	 * can't really unregister ourselves now, but at least don't crash.
+	 */
+	if (earlycon && !earlycon_neutered && !is_earlycon_still_valid()) {
+		pr_warn("Neutering kgdb since boot console vanished\n");
+		earlycon_neutered = true;
+	}
+}
+
+static void earlycon_kgdboc_post_exp_handler(void)
+{
+	atomic_dec(&ignore_console_lock_warning);
+}
+
+static struct kgdb_io earlycon_kgdboc_io_ops = {
+	.name			= "earlycon_kgdboc",
+	.read_char		= earlycon_kgdboc_get_char,
+	.write_char		= earlycon_kgdboc_put_char,
+	.pre_exception		= earlycon_kgdboc_pre_exp_handler,
+	.post_exception		= earlycon_kgdboc_post_exp_handler,
+	.is_console		= true,
+};
+
+static int __init earlycon_kgdboc_init(char *opt)
+{
+	struct console *con;
+
+	kdb_init(KDB_INIT_EARLY);
+
+	/*
+	 * Look for a matching console, or if the name was left blank just
+	 * pick the first one we find.
+	 */
+	console_lock();
+	for_each_console(con) {
+		if (con->write && con->read &&
+		    (con->flags & (CON_BOOT | CON_ENABLED)) &&
+		    (!opt || !opt[0] || strcmp(con->name, opt) == 0))
+			break;
+	}
+	console_unlock();
+
+	if (!con) {
+		pr_info("Couldn't find kgdb earlycon\n");
+		return 0;
+	}
+
+	earlycon = con;
+	pr_info("Going to register kgdb with earlycon '%s'\n", con->name);
+	if (kgdb_register_io_module(&earlycon_kgdboc_io_ops, false) != 0) {
+		earlycon = NULL;
+		pr_info("Failed to register kgdb with earlycon\n");
+		return 0;
+	}
+
+	return 0;
+}
+
+early_param("earlycon_kgdboc", earlycon_kgdboc_init);
 #endif /* CONFIG_KGDB_SERIAL_CONSOLE */
 
 module_init(init_kgdboc);
diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
index 7371517aeacc..2e86307f2683 100644
--- a/include/linux/kgdb.h
+++ b/include/linux/kgdb.h
@@ -323,7 +323,8 @@ static inline int kgdb_unregister_nmi_console(void) { return 0; }
 static inline bool kgdb_nmi_poll_knock(void) { return 1; }
 #endif
 
-extern int kgdb_register_io_module(struct kgdb_io *local_kgdb_io_ops);
+extern int kgdb_register_io_module(struct kgdb_io *new_dbg_io_ops,
+				   bool replace);
 extern void kgdb_unregister_io_module(struct kgdb_io *local_kgdb_io_ops);
 extern struct kgdb_io *dbg_io_ops;
 
diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index 9a4551a0fb4b..82a9af56a0b5 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -1070,16 +1070,21 @@ EXPORT_SYMBOL_GPL(kgdb_schedule_breakpoint);
 /**
  *	kgdb_register_io_module - register KGDB IO module
  *	@new_dbg_io_ops: the io ops vector
+ *	@replace: If true it's OK if there were old ops.  This is used
+ *		  to transition from early kgdb to normal kgdb.  It's
+ *		  assumed these are the same device so kgdb can continue.
  *
  *	Register it with the KGDB core.
  */
-int kgdb_register_io_module(struct kgdb_io *new_dbg_io_ops)
+int kgdb_register_io_module(struct kgdb_io *new_dbg_io_ops, bool replace)
 {
+	struct kgdb_io *old_dbg_io_ops;
 	int err;
 
 	spin_lock(&kgdb_registration_lock);
 
-	if (dbg_io_ops) {
+	old_dbg_io_ops = dbg_io_ops;
+	if (dbg_io_ops && !replace) {
 		spin_unlock(&kgdb_registration_lock);
 
 		pr_err("Another I/O driver is already registered with KGDB\n");
@@ -1098,6 +1103,12 @@ int kgdb_register_io_module(struct kgdb_io *new_dbg_io_ops)
 
 	spin_unlock(&kgdb_registration_lock);
 
+	if (replace) {
+		pr_info("Replaced I/O driver %s with %s\n",
+			old_dbg_io_ops->name, new_dbg_io_ops->name);
+		return 0;
+	}
+
 	pr_info("Registered I/O driver %s\n", new_dbg_io_ops->name);
 
 	/* Arm KGDB now. */
-- 
2.26.0.110.g2183baf09c-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
