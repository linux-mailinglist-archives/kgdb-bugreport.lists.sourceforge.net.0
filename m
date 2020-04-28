Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B50DF1BCF09
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 28 Apr 2020 23:44:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jTY1V-0005oT-HY
	for lists+kgdb-bugreport@lfdr.de; Tue, 28 Apr 2020 21:44:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jTY1U-0005oM-Bm
 for kgdb-bugreport@lists.sourceforge.net; Tue, 28 Apr 2020 21:44:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mhpWjztj/EEP0KJ9BJr2ciDomvHngctouThUMQ27Ong=; b=md+7hTISHRU+qQpxG9vgLhG8cm
 OJGrgxp9/POZF2/AMve88ctaHVTO4uPFEYH3Rq1FAOJd/bt3450t94NlaPqp5GHi0CEfiNEKmqmO3
 22KJFKJ/My/MGGuk3UJ+iscMJDeZK5wormpBvKeqg4tFLbfx3FNuWEnesF1rMuq84ukA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mhpWjztj/EEP0KJ9BJr2ciDomvHngctouThUMQ27Ong=; b=WgaK1Ug4TdM2Kct6Sya9WXCrKv
 j+1lYWk9o2twOoU6spBJsx8qmGOKiGGrqIB/Vb0IYL/Dmstuv//r6Q8V3zGBZab1x0iJqbaouUHNL
 twdXbs9xeCd+ohWm4dK1mlY1Eg3qf9ucXIWl06h9CyKugGNqNrWD4s7BOI0oEvcPEeoY=;
Received: from mail-ua1-f68.google.com ([209.85.222.68])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jTY1Q-00314x-Dr
 for kgdb-bugreport@lists.sourceforge.net; Tue, 28 Apr 2020 21:44:12 +0000
Received: by mail-ua1-f68.google.com with SMTP id c24so92307uap.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 28 Apr 2020 14:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mhpWjztj/EEP0KJ9BJr2ciDomvHngctouThUMQ27Ong=;
 b=JXJ4BbqiXC90iuxC/sbSW8sFrtgTeMnPtp/aosQPptEP1N7A8R4wa6SPWWugbnlaAq
 hYI82a9yXmSGmGuBBHpUPYZIXaBE4OPvx94E6ad9xCOsuS4w0sv2q1NVlpOIYBb21oxW
 +huo+U1Gda7quKrsN05pZtieA4uOQGeLccyX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mhpWjztj/EEP0KJ9BJr2ciDomvHngctouThUMQ27Ong=;
 b=HhR/54tokTn0vT0jc8C35gOEL1dPViLe0wT+OfUZW4PRsT/n022y+WvJxNIo4Jkm+x
 2Gtbthu4OkYW5duaWtsqmucLP9wKYbRGoqufQqPACMAa7KSP9Kvr7Xg9YSOl/eZQlG5q
 6hijFOHGfrnEDV1sQHjxPI+EWv96GbK58QLW58T2zly8WJrtL8rPgSwcOJi8Af0dDaNL
 GoRCHewbpNX0DPmPAGWNDFWk0+MY/b2hpc8HxRmZBDo/D+I4auuSTaz9JRaGXYGbWWow
 oTOIvewOQgSnuYDUNgKY2WCTaAFD/9ZpPj3UcC5b0GQIdeoay71cL7P+/bdc56YKGyDS
 p9EQ==
X-Gm-Message-State: AGi0PuYhT8jrfL1YOUdpPhtPnEODWpgtsYy2k9S71SOVOQyDoEaNClwA
 Xd/2tshJBttRZ/fauP5L2xVEnNF0osk46g==
X-Google-Smtp-Source: APiQypIDUnwqjoRrY4gsSCP8N0CmE2H9PUO7MJUfaEAfq1/0o4W+Qh9gZ6sAtWWHzrhr6OevwtHiCw==
X-Received: by 2002:a17:902:6947:: with SMTP id
 k7mr8146726plt.298.1588108468574; 
 Tue, 28 Apr 2020 14:14:28 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id 18sm2988202pjf.30.2020.04.28.14.14.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 14:14:27 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: jason.wessel@windriver.com, daniel.thompson@linaro.org,
 gregkh@linuxfoundation.org
Date: Tue, 28 Apr 2020 14:13:47 -0700
Message-Id: <20200428141218.v3.7.I8fba5961bf452ab92350654aa61957f23ecf0100@changeid>
X-Mailer: git-send-email 2.26.2.303.gf8c07b1a785-goog
In-Reply-To: <20200428211351.85055-1-dianders@chromium.org>
References: <20200428211351.85055-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.68 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.68 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jTY1Q-00314x-Dr
Subject: [Kgdb-bugreport] [PATCH v3 07/11] kgdboc: Add kgdboc_earlycon to
 support early kgdb using boot consoles
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
Cc: corbet@lwn.net, kgdb-bugreport@lists.sourceforge.net, hpa@zytor.com,
 bjorn.andersson@linaro.org, agross@kernel.org, bp@alien8.de,
 linux-serial@vger.kernel.org, catalin.marinas@arm.com, jslaby@suse.com,
 tglx@linutronix.de, will@kernel.org, mingo@redhat.com,
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
"kgdboc_earlycon".

The console API isn't really intended to have clients work with it
like we're doing.  Specifically there doesn't appear to be any way for
clients to be notified about a boot console being unregistered.  We'll
work around this by checking that our console is still valid before
using it.  We'll also try to transition off of the boot console and
onto the "tty" API as quickly as possible.

The normal/expected way to make all this work is to use
"kgdboc_earlycon" and "kgdboc" together.  You should point them both
to the same physical serial connection.  At boot time, as the system
transitions from the boot console to the normal console, kgdb will
switch over.  If you don't use things in the normal/expected way it's
a bit of a buyer-beware situation.  Things thought about:

- If you specify only "kgdboc_earlycon" but not "kgdboc" and the boot
  console vanishes at a weird time we'll panic if someone tries to
  drop into kgdb.
- If you use "keep_bootcon" (which is already a bit of a buyer-beware
  option) and specify "kgdboc_earlycon" but not "kgdboc" we'll keep
  trying to use your boot console for kgdb.
- If your "kgdboc_earlycon" and "kgdboc" devices are not the same
  device things should work OK, but it'll be your job to switch over
  which device you're monitoring (including figuring out how to switch
  over gdb in-flight if you're using it).

When trying to enable "kgdboc_earlycon" it should be noted that the
names that are registered through the boot console layer and the tty
layer are not the same for the same port.  For example when debugging
on one board I'd need to pass "kgdboc_earlycon=qcom_geni
kgdboc=ttyMSM0" to enable things properly.  Since digging up the boot
console name is a pain and there will rarely be more than one boot
console enabled, you can provide the "kgdboc_earlycon" parameter
without specifying the name of the boot console.  In this case we'll
just pick the first boot that implements read() that we find.

This new "kgdboc_earlycon" parameter should be contrasted to the
existing "ekgdboc" parameter.  While both provide a way to debug very
early, the usage and mechanisms are quite different.  Specifically
"kgdboc_earlycon" is meant to be used in tandem with "kgdboc" and
there is a transition from one to the other.  The "ekgdboc" parameter,
on the other hand, replaces the "kgdboc" parameter.  It runs the same
logic as the "kgdboc" parameter but just relies on your TTY driver
being present super early.  The only known usage of the old "ekgdboc"
parameter is documented as "ekgdboc=kbd earlyprintk=vga".  It should
be noted that "kbd" has special treatment allowing it to init early as
a tty device.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Tested-by: Sumit Garg <sumit.garg@linaro.org>
---
I have kept Greg's Reviewed-by and Sumit's Tested-by tags on this
commit despite changes that aren't totally trivial.  Please yell if
you disagree with this.  Reasons:
- Greg's Reviewed-by seemed more an overall acknowledgment that the
  series wasn't totally insane rather than a detailed review.  I don't
  think the changes from v2 to v3 change that.
- Sumit's Tested-by seemed useful as confirmation that someone else
  made this work on a machine that wasn't mine.  I don't believe that
  the changes from v2 to v3 should affect anything here.

Changes in v3:
- Add deinit() to I/O ops to know a driver can be replaced.
- Don't just neuter input, panic if earlycon vanishes.
- No extra param to kgdb_register_io_module().
- Renamed earlycon_kgdboc to kgdboc_earlycon.
- Simplify earlycon_kgdb deinit by using the deinit() function.

Changes in v2:
- Assumes we have ("kgdb: Disable WARN_CONSOLE_UNLOCKED for all kgdb")
- Fix kgdbts, tty/mips_ejtag_fdc, and usb/early/ehci-dbgp

 drivers/tty/serial/kgdboc.c | 136 ++++++++++++++++++++++++++++++++++++
 include/linux/kgdb.h        |   4 ++
 kernel/debug/debug_core.c   |  23 ++++--
 3 files changed, 159 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
index 519d8cfbfbed..7aca0a67fc0b 100644
--- a/drivers/tty/serial/kgdboc.c
+++ b/drivers/tty/serial/kgdboc.c
@@ -21,6 +21,7 @@
 #include <linux/input.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/serial_core.h>
 
 #define MAX_CONFIG_LEN		40
 
@@ -42,6 +43,13 @@ static int			kgdb_tty_line;
 
 static struct platform_device *kgdboc_pdev;
 
+#ifdef CONFIG_KGDB_SERIAL_CONSOLE
+static struct kgdb_io		kgdboc_earlycon_io_ops;
+struct console			*earlycon;
+#else /* ! CONFIG_KGDB_SERIAL_CONSOLE */
+#define earlycon NULL
+#endif /* ! CONFIG_KGDB_SERIAL_CONSOLE */
+
 #ifdef CONFIG_KDB_KEYBOARD
 static int kgdboc_reset_connect(struct input_handler *handler,
 				struct input_dev *dev,
@@ -135,8 +143,45 @@ static void kgdboc_unregister_kbd(void)
 #define kgdboc_restore_input()
 #endif /* ! CONFIG_KDB_KEYBOARD */
 
+#ifdef CONFIG_KGDB_SERIAL_CONSOLE
+
+static void cleanup_earlycon(void)
+{
+	if (earlycon)
+		kgdb_unregister_io_module(&kgdboc_earlycon_io_ops);
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
+	if (earlycon && !is_earlycon_still_valid()) {
+		pr_warn("earlycon vanished; unregistering\n");
+		cleanup_earlycon();
+	}
+	console_unlock();
+}
+
+#else /* ! CONFIG_KGDB_SERIAL_CONSOLE */
+
+static inline void cleanup_earlycon(void) { ; }
+static inline void cleanup_earlycon_if_invalid(void) { ; }
+
+#endif /* ! CONFIG_KGDB_SERIAL_CONSOLE */
+
 static void cleanup_kgdboc(void)
 {
+	cleanup_earlycon();
+
 	if (configured != 1)
 		return;
 
@@ -206,6 +251,14 @@ static int configure_kgdboc(void)
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
 
@@ -409,6 +462,89 @@ static int __init kgdboc_early_init(char *opt)
 }
 
 early_param("ekgdboc", kgdboc_early_init);
+
+static int kgdboc_earlycon_get_char(void)
+{
+	char c;
+
+	if (!earlycon->read(earlycon, &c, 1))
+		return NO_POLL_CHAR;
+
+	return c;
+}
+
+static void kgdboc_earlycon_put_char(u8 chr)
+{
+	earlycon->write(earlycon, &chr, 1);
+}
+
+static void kgdboc_earlycon_pre_exp_handler(void)
+{
+	/*
+	 * We don't get notified when the boot console is unregistered.
+	 * Double-check when we enter the debugger.  Unfortunately we
+	 * can't really unregister ourselves now, so we panic.  We rely
+	 * on kgdb's ability to detect re-entrancy to make the panic
+	 * take effect.
+	 *
+	 * NOTE: if you're here in the lull when the real console has
+	 * replaced the boot console but our init hasn't run yet it's
+	 * possible that the "keep_bootcon" argument may help.
+	 */
+	if (earlycon && !is_earlycon_still_valid())
+		panic("KGDB earlycon vanished and nothing replaced it\n");
+}
+
+static void kgdboc_earlycon_deinit(void)
+{
+	earlycon = NULL;
+}
+
+static struct kgdb_io kgdboc_earlycon_io_ops = {
+	.name			= "kgdboc_earlycon",
+	.read_char		= kgdboc_earlycon_get_char,
+	.write_char		= kgdboc_earlycon_put_char,
+	.pre_exception		= kgdboc_earlycon_pre_exp_handler,
+	.deinit			= kgdboc_earlycon_deinit,
+	.is_console		= true,
+};
+
+static int __init kgdboc_earlycon_init(char *opt)
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
+	if (kgdb_register_io_module(&kgdboc_earlycon_io_ops) != 0) {
+		earlycon = NULL;
+		pr_info("Failed to register kgdb with earlycon\n");
+		return 0;
+	}
+
+	return 0;
+}
+
+early_param("kgdboc_earlycon", kgdboc_earlycon_init);
 #endif /* CONFIG_KGDB_SERIAL_CONSOLE */
 
 module_init(init_kgdboc);
diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
index b072aeb1fd78..77a3c519478a 100644
--- a/include/linux/kgdb.h
+++ b/include/linux/kgdb.h
@@ -269,6 +269,9 @@ struct kgdb_arch {
  * @write_char: Pointer to a function that will write one char.
  * @flush: Pointer to a function that will flush any pending writes.
  * @init: Pointer to a function that will initialize the device.
+ * @deinit: Pointer to a function that will deinit the device. Implies that
+ * this I/O driver is temporary and expects to be replaced. Called when
+ * an I/O driver is replaced or explicitly unregistered.
  * @pre_exception: Pointer to a function that will do any prep work for
  * the I/O driver.
  * @post_exception: Pointer to a function that will do any cleanup work
@@ -282,6 +285,7 @@ struct kgdb_io {
 	void			(*write_char) (u8);
 	void			(*flush) (void);
 	int			(*init) (void);
+	void			(*deinit) (void);
 	void			(*pre_exception) (void);
 	void			(*post_exception) (void);
 	int			is_console;
diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index faf5bd4c34ee..2d74dcbca477 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -1075,15 +1075,21 @@ EXPORT_SYMBOL_GPL(kgdb_schedule_breakpoint);
  */
 int kgdb_register_io_module(struct kgdb_io *new_dbg_io_ops)
 {
+	struct kgdb_io *old_dbg_io_ops;
 	int err;
 
 	spin_lock(&kgdb_registration_lock);
 
-	if (dbg_io_ops) {
-		spin_unlock(&kgdb_registration_lock);
+	old_dbg_io_ops = dbg_io_ops;
+	if (old_dbg_io_ops) {
+		if (!old_dbg_io_ops->deinit) {
+			spin_unlock(&kgdb_registration_lock);
 
-		pr_err("Another I/O driver is already registered with KGDB\n");
-		return -EBUSY;
+			pr_err("KGDB I/O driver %s can't replace %s.\n",
+				new_dbg_io_ops->name, old_dbg_io_ops->name);
+			return -EBUSY;
+		}
+		old_dbg_io_ops->deinit();
 	}
 
 	if (new_dbg_io_ops->init) {
@@ -1098,6 +1104,12 @@ int kgdb_register_io_module(struct kgdb_io *new_dbg_io_ops)
 
 	spin_unlock(&kgdb_registration_lock);
 
+	if (old_dbg_io_ops) {
+		pr_info("Replaced I/O driver %s with %s\n",
+			old_dbg_io_ops->name, new_dbg_io_ops->name);
+		return 0;
+	}
+
 	pr_info("Registered I/O driver %s\n", new_dbg_io_ops->name);
 
 	/* Arm KGDB now. */
@@ -1134,6 +1146,9 @@ void kgdb_unregister_io_module(struct kgdb_io *old_dbg_io_ops)
 
 	spin_unlock(&kgdb_registration_lock);
 
+	if (old_dbg_io_ops->deinit)
+		old_dbg_io_ops->deinit();
+
 	pr_info("Unregistered I/O driver %s, debugger disabled\n",
 		old_dbg_io_ops->name);
 }
-- 
2.26.2.303.gf8c07b1a785-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
