Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0761C9BBC
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  7 May 2020 22:09:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jWmpi-0000gX-TD
	for lists+kgdb-bugreport@lfdr.de; Thu, 07 May 2020 20:09:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jWmph-0000gG-8P
 for kgdb-bugreport@lists.sourceforge.net; Thu, 07 May 2020 20:09:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0JDP38dpsk7KN8hEkRFGKZlhEIk/6C1p/e8k95JU/HI=; b=F2/pdpEWbWCHhbg/SdIKCxpROV
 lGw2+jEAU09UUFVG5iUBBD8mvvMyszfm1fyPq7TFeTFDrFFqJhMD1ZulcuU3jAKy0I6yLmYJBZaVs
 i8CbgfgE2WtFxffGGslrW0KebJ6QmInyNW5hM6oRu54Mu8SIdctfJN5X3WzZOzjMcpho=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0JDP38dpsk7KN8hEkRFGKZlhEIk/6C1p/e8k95JU/HI=; b=FiMlej15N80+1FByT2ip2uYuUl
 LEPEjQg9ewEoj3lfn8W3M1nm7du/FFVyU/Ru86ZKWoQaa8pKwnKFhk8Io12GGvrYrKaEex334j6hq
 2P64dxb3hdWM2ou8wL4+8IN8q2Kr/I8TTDQA4bHS+8q4py5VeMUquUbpn8omV1Hl3hxs=;
Received: from mail-pg1-f196.google.com ([209.85.215.196])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jWmpf-00BbbI-Mc
 for kgdb-bugreport@lists.sourceforge.net; Thu, 07 May 2020 20:09:25 +0000
Received: by mail-pg1-f196.google.com with SMTP id l25so3298665pgc.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 07 May 2020 13:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0JDP38dpsk7KN8hEkRFGKZlhEIk/6C1p/e8k95JU/HI=;
 b=Uz1I0/Qyr46MnWPBV0Pdl3MlddTJFfDNTtIwTIsnUcfrgFDeFyAYLWrlJN5MlYfhy9
 Atnq7ijIibilELMzMIIu79dsXN1LhJeFFDY00qNOvh+yJ3n1gaHYiDqnTky6PMiYWUmp
 l1YUhsqXrk/+1UPVy2mqSOvba/H7RCGvEvvqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0JDP38dpsk7KN8hEkRFGKZlhEIk/6C1p/e8k95JU/HI=;
 b=lwO0pVCLPrMkFbNYM8fwJxZj+eXW9nzsYbaEkkC14zHsZQIxnNiyk+LpmzbayieP9n
 bBbl4Lk+zcYvSXEtQ87nxjllrwak1Fo/QFlvv270s0gCcNK6f0GusAN1qSg5c43Hrpzl
 ngZWI4mW1Iqd6lwh52sR6xNXrJUjxe0u3f4v2Qz+NuXWv3LlEZYaTYN37jRaH2V8RbtW
 AOCVi4r1sS89PCB1ji2wuMUh9c1U9Wwy9VgvHJh8NVzV0xVRMSRs1hPjqST/3HhCW8CX
 VAJ+T66mPMbHh1it+l+2hoX8bBJVzymZCAN+XErRVGQPJKG/4V+XJSbCJs4bBubR8xvH
 z8EQ==
X-Gm-Message-State: AGi0Pub093xWF1kGANpAFWVrABM5eKvUEtzzDFPvmkkd0jZKXvxeqBaX
 GVk1U1iKXKJNi42gwuVg3iXK2A==
X-Google-Smtp-Source: APiQypKC2QxYl//EFJYF9h7JAaIzKVftkZguEa/cNFd1sq9osVEi5yaiH9HyFLHdv04Uzjt/t1mRFA==
X-Received: by 2002:a63:d501:: with SMTP id c1mr12398639pgg.186.1588882150477; 
 Thu, 07 May 2020 13:09:10 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id d203sm5547601pfd.79.2020.05.07.13.09.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 13:09:09 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: jason.wessel@windriver.com, daniel.thompson@linaro.org,
 gregkh@linuxfoundation.org
Date: Thu,  7 May 2020 13:08:46 -0700
Message-Id: <20200507130644.v4.8.I8fba5961bf452ab92350654aa61957f23ecf0100@changeid>
X-Mailer: git-send-email 2.26.2.645.ge9eca65c58-goog
In-Reply-To: <20200507200850.60646-1-dianders@chromium.org>
References: <20200507200850.60646-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.196 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.196 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jWmpf-00BbbI-Mc
Subject: [Kgdb-bugreport] [PATCH v4 08/12] kgdboc: Add kgdboc_earlycon to
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
Cc: catalin.marinas@arm.com, will@kernel.org, corbet@lwn.net,
 kgdb-bugreport@lists.sourceforge.net, jslaby@suse.com, agross@kernel.org,
 bjorn.andersson@linaro.org, mingo@redhat.com, bp@alien8.de,
 linux-serial@vger.kernel.org, hpa@zytor.com, tglx@linutronix.de,
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

The normal/expected way to make all this work is to use
"kgdboc_earlycon" and "kgdboc" together.  You should point them both
to the same physical serial connection.  At boot time, as the system
transitions from the boot console to the normal console (and registers
a tty), kgdb will switch over.

One awkward part of all this, though, is that there can be a window
where the boot console goes away and we can't quite transtion over to
the main kgdboc that uses the tty layer.  There are two main problems:

1. The act of registering the tty doesn't cause any call into kgdboc
   so there is a window of time when the tty is there but kgdboc's
   init code hasn't been called so we can't transition to it.

2. On some serial drivers the normal console inits (and replaces the
   boot console) quite early in the system.  Presumably these drivers
   were coded up before earlycon worked as well as it does today and
   probably they don't need to do this anymore, but it causes us
   problems nontheless.

Problem #1 is not too big of a deal somewhat due to the luck of probe
ordering.  kgdboc is last in the tty/serial/Makefile so its probe gets
right after all other tty devices.  It's not fun to rely on this, but
it does work for the most part.

Problem #2 is a big deal, but only for some serial drivers.  Other
serial drivers end up registering the console (which gets rid of the
boot console) and tty at nearly the same time.

The way we'll deal with the window when the system has stopped using
the boot console and the time when we're setup using the tty is to
keep using the boot console.  This may sound surprising, but it has
been found to work well in practice.  If it doesn't work, it shouldn't
be too hard for a given serial driver to make it keep working.
Specifically, it's expected that the read()/write() function provided
in the boot console should be the same (or nearly the same) as the
normal kgdb polling functions.  That means continuing to use them
should work just fine.  To make things even more likely to work work
we'll also trap the recently added exit() function in the boot console
we're using and delay any calls to it until we're all done with the
boot console.

NOTE: there could be ways to use all this in weird / unexpected ways.
If you do something like this, it's a bit of a buyer beware situation.
Specifically:
- If you specify only "kgdboc_earlycon" but not "kgdboc" then
  (depending on your serial driver) things will probably work OK, but
  you'll get a warning printed the first time you use kgdb after the
  boot console is gone.  You'd only be able to do this, of course, if
  the serial driver you're running atop provided an early boot console.
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
  think the changes from v2 to v3 change that.  The changes from v3 to
  v4 include a little extra craziness and I considered removing the
  tag but I don't think it affects the overall concept so I kept it.
- Sumit's Tested-by seemed useful as confirmation that someone else
  made this work on a machine that wasn't mine.  I don't believe that
  the changes from v2 to v4 should affect anything here.

Also note that this incorporates ideas and a bit of code that Daniel
posted on the list.  Daniel: I'll leave it up to you if you want to
add a "Co-Developed-by" credit.

Changes in v4:
- Add comment about why we always return 0 in kgdboc_earlycon_init().
- Major overhauls to commit message.
- No more #ifdef CONFIG_KGDB_SERIAL_CONSOLE.
- Now keep using bootcon even when the system stops.
- Print "replacing" message before calling deinit().
- earlycon should be static.

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
 kernel/debug/debug_core.c   |  22 ++++--
 3 files changed, 158 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
index 2e9158fff976..047d3ef14e85 100644
--- a/drivers/tty/serial/kgdboc.c
+++ b/drivers/tty/serial/kgdboc.c
@@ -21,6 +21,7 @@
 #include <linux/input.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/serial_core.h>
 
 #define MAX_CONFIG_LEN		40
 
@@ -42,6 +43,10 @@ static int			kgdb_tty_line;
 
 static struct platform_device *kgdboc_pdev;
 
+static struct kgdb_io		kgdboc_earlycon_io_ops;
+static struct console		*earlycon;
+static int                      (*earlycon_orig_exit)(struct console *con);
+
 #ifdef CONFIG_KDB_KEYBOARD
 static int kgdboc_reset_connect(struct input_handler *handler,
 				struct input_dev *dev,
@@ -137,6 +142,9 @@ static void kgdboc_unregister_kbd(void)
 
 static void cleanup_kgdboc(void)
 {
+	if (earlycon)
+		kgdb_unregister_io_module(&kgdboc_earlycon_io_ops);
+
 	if (configured != 1)
 		return;
 
@@ -409,6 +417,134 @@ static int __init kgdboc_early_init(char *opt)
 
 early_param("ekgdboc", kgdboc_early_init);
 
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
+	struct console *con;
+	static bool already_warned;
+
+	if (already_warned)
+		return;
+
+	/*
+	 * When the first normal console comes up the kernel will take all
+	 * the boot consoles out of the list.  Really, we should stop using
+	 * the boot console when it does that but until a TTY is registered
+	 * we have no other choice so we keep using it.  Since not all
+	 * serial drivers might be OK with this, print a warning once per
+	 * boot if we detect this case.
+	 */
+	for_each_console(con)
+		if (con == earlycon)
+			return;
+
+	already_warned = true;
+	pr_warn("kgdboc_earlycon is still using bootconsole\n");
+}
+
+static int kgdboc_earlycon_deferred_exit(struct console *con)
+{
+	/*
+	 * If we get here it means the boot console is going away but we
+	 * don't yet have a suitable replacement.  Don't pass through to
+	 * the original exit routine.  We'll call it later in our deinit()
+	 * function.  For now, restore the original exit() function pointer
+	 * as a sentinal that we've hit this point.
+	 */
+	con->exit = earlycon_orig_exit;
+
+	return 0;
+}
+
+static void kgdboc_earlycon_deinit(void)
+{
+	if (!earlycon)
+		return;
+
+	if (earlycon->exit == kgdboc_earlycon_deferred_exit)
+		/*
+		 * kgdboc_earlycon is exiting but original boot console exit
+		 * was never called (AKA kgdboc_earlycon_deferred_exit()
+		 * didn't ever run).  Undo our trap.
+		 */
+		earlycon->exit = earlycon_orig_exit;
+	else if (earlycon->exit)
+		/*
+		 * We skipped calling the exit() routine so we could try to
+		 * keep using the boot console even after it went away.  We're
+		 * finally done so call the function now.
+		 */
+		earlycon->exit(earlycon);
+
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
+
+	if (!con) {
+		pr_info("Couldn't find kgdb earlycon\n");
+		goto unlock;
+	}
+
+	earlycon = con;
+	pr_info("Going to register kgdb with earlycon '%s'\n", con->name);
+	if (kgdb_register_io_module(&kgdboc_earlycon_io_ops) != 0) {
+		earlycon = NULL;
+		pr_info("Failed to register kgdb with earlycon\n");
+	} else {
+		/* Trap exit so we can keep earlycon longer if needed. */
+		earlycon_orig_exit = con->exit;
+		con->exit = kgdboc_earlycon_deferred_exit;
+	}
+
+unlock:
+	console_unlock();
+
+	/* Non-zero means malformed option so we always return zero */
+	return 0;
+}
+
+early_param("kgdboc_earlycon", kgdboc_earlycon_init);
+
 module_init(init_kgdboc);
 module_exit(exit_kgdboc);
 module_param_call(kgdboc, param_set_kgdboc_var, param_get_string, &kps, 0644);
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
index faf5bd4c34ee..3e7d96389525 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -1075,15 +1075,23 @@ EXPORT_SYMBOL_GPL(kgdb_schedule_breakpoint);
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
+		pr_info("Replacing I/O driver %s with %s\n",
+			old_dbg_io_ops->name, new_dbg_io_ops->name);
+		old_dbg_io_ops->deinit();
 	}
 
 	if (new_dbg_io_ops->init) {
@@ -1098,6 +1106,9 @@ int kgdb_register_io_module(struct kgdb_io *new_dbg_io_ops)
 
 	spin_unlock(&kgdb_registration_lock);
 
+	if (old_dbg_io_ops)
+		return 0;
+
 	pr_info("Registered I/O driver %s\n", new_dbg_io_ops->name);
 
 	/* Arm KGDB now. */
@@ -1134,6 +1145,9 @@ void kgdb_unregister_io_module(struct kgdb_io *old_dbg_io_ops)
 
 	spin_unlock(&kgdb_registration_lock);
 
+	if (old_dbg_io_ops->deinit)
+		old_dbg_io_ops->deinit();
+
 	pr_info("Unregistered I/O driver %s, debugger disabled\n",
 		old_dbg_io_ops->name);
 }
-- 
2.26.2.645.ge9eca65c58-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
