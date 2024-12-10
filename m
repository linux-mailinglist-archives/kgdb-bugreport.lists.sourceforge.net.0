Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 649A39EA33C
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 10 Dec 2024 01:01:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1tKngU-00013d-Kn
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 10 Dec 2024 00:01:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <rdunlap@infradead.org>) id 1tKngT-00013S-JQ
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 10 Dec 2024 00:01:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PBXruUUq7CFnP5baKZ7oFYfGkNPXA/nLTilEYn4xNxQ=; b=F8LZ23xNwsmxRFg5sm5vwVJeco
 pqFwbqIPqvj+Fj8+ghVnC27uSorqjH6kPOaY4wAM+d3AAz7mZtV6ci+wdkWzR3LAqEsB0eJNzVYzP
 ZIIj3GXsYH7LuNpW8RUblEmIbIv9VQYK7NOpw+Tda/jkOobuPqNnF0KT9T3LFuZv3+GE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=PBXruUUq7CFnP5baKZ7oFYfGkNPXA/nLTilEYn4xNxQ=; b=j
 om3Tl6iiw2C70PazzJ3ZiHBYoMLZj65Hagc6UGCtZA/6dn2ejFSD/HRlz8vXtsda82YwjkkwpxjT8
 Go69JqndKUeCl0w5QXApEzKgnoYGqR2jxAZKNr0z3LZdb5bS3h3wcI6uTvoGfsebV4vXlt2VVj5vy
 ZE3UcF/b48gLKrw4=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tKngS-0006xj-7Q for kgdb-bugreport@lists.sourceforge.net;
 Tue, 10 Dec 2024 00:01:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=PBXruUUq7CFnP5baKZ7oFYfGkNPXA/nLTilEYn4xNxQ=; b=jxd9eSFB8O7Bg0AfXpNa7MfiD1
 kzUy8ZVQXBLehc9K2sr80w8/4pklxtkLIDpDj1KY3GawCwZ2Y884+0sM6YQL+v3qTUPimhdfEDGRk
 DKlCu2csdL92kq85vCYOCb2doThNFQK1zG9zIcm69+Mq1z9iQdQl9DL2gbwM//zzuMPqWIkYjj9tH
 1vNN97oq9QTOWzMiJ2MgDjM800Jzs5FZIrBaqGGd4zVRtZuB7eUuefjmCbi1myuqFban3TYhbRmq6
 ggj1AmmlX5zw6qu/fQl1U5inxiW7eksB0PCeF8PaFeCVm/nGjY6SKa0BFUCJl01ZjeW6jUXrGLNi9
 crp1Jcmw==;
Received: from [50.53.2.24] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
 id 1tKngD-00000009dUD-10C1; Tue, 10 Dec 2024 00:00:45 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-doc@vger.kernel.org
Date: Mon,  9 Dec 2024 16:00:41 -0800
Message-ID: <20241210000041.305477-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Move gdb and kgdb debugging documentation to the dedicated
 debugging directory (Documentation/process/debugging/). Adjust the index.rst
 files to follow the file movement. Adjust files that refer to th [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [198.137.202.133 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [198.137.202.133 listed in sa-accredit.habeas.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1tKngS-0006xj-7Q
Subject: [Kgdb-bugreport] [PATCH v3] Documentation: move dev-tools debugging
 files to process/debugging/
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
Cc: linux-serial@vger.kernel.org,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Jonathan Corbet <corbet@lwn.net>, kgdb-bugreport@lists.sourceforge.net,
 Randy Dunlap <rdunlap@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Thompson <danielt@kernel.org>, workflows@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 Hu Haowen <2023002089@link.tyut.edu.cn>,
 Andrew Morton <akpm@linux-foundation.org>, Alex Shi <alexs@kernel.org>,
 linux-debuggers@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Move gdb and kgdb debugging documentation to the dedicated
debugging directory (Documentation/process/debugging/).
Adjust the index.rst files to follow the file movement.
Adjust files that refer to these moved files to follow the file movement.
Update location of kgdb.rst in MAINTAINERS file.
Add a link from dev-tools/index to process/debugging/index.

Note: translations are not updated.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: workflows@vger.kernel.org
Cc: Jason Wessel <jason.wessel@windriver.com>
Cc: Daniel Thompson <danielt@kernel.org>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: linux-debuggers@vger.kernel.org
Cc: kgdb-bugreport@lists.sourceforge.net
Cc: Doug Anderson <dianders@chromium.org>
Cc: Alex Shi <alexs@kernel.org>
Cc: Hu Haowen <2023002089@link.tyut.edu.cn>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-serial@vger.kernel.org
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Acked-by: Daniel Thompson <danielt@kernel.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
v3: add link to process/debugging/index from dev-tools/index.

@Andrew, please drop v2 of this patch.

 Documentation/admin-guide/README.rst                                 | 4 ++--
 Documentation/dev-tools/index.rst                                    | 5 +++--
 .../{dev-tools => process/debugging}/gdb-kernel-debugging.rst        | 0
 Documentation/process/debugging/index.rst                            | 2 ++
 Documentation/{dev-tools => process/debugging}/kgdb.rst              | 0
 MAINTAINERS                                                          | 2 +-
 include/linux/tty_driver.h                                           | 2 +-
 lib/Kconfig.debug                                                    | 2 +-
 lib/Kconfig.kgdb                                                     | 2 +-
 9 files changed, 11 insertions(+), 8 deletions(-)


diff --git a/Documentation/admin-guide/README.rst b/Documentation/admin-guide/README.rst
index f2bebff6a733..eb9452668909 100644
--- a/Documentation/admin-guide/README.rst
+++ b/Documentation/admin-guide/README.rst
@@ -356,5 +356,5 @@ instructions at 'Documentation/admin-guide/reporting-issues.rst'.
 
 Hints on understanding kernel bug reports are in
 'Documentation/admin-guide/bug-hunting.rst'. More on debugging the kernel
-with gdb is in 'Documentation/dev-tools/gdb-kernel-debugging.rst' and
-'Documentation/dev-tools/kgdb.rst'.
+with gdb is in 'Documentation/process/debugging/gdb-kernel-debugging.rst' and
+'Documentation/process/debugging/kgdb.rst'.
diff --git a/Documentation/dev-tools/index.rst b/Documentation/dev-tools/index.rst
index 3c0ac08b2709..65c54b27a60b 100644
--- a/Documentation/dev-tools/index.rst
+++ b/Documentation/dev-tools/index.rst
@@ -10,6 +10,9 @@ whole; patches welcome!
 A brief overview of testing-specific tools can be found in
 Documentation/dev-tools/testing-overview.rst
 
+Tools that are specific to debugging can be found in
+Documentation/process/debugging/index.rst
+
 .. toctree::
    :caption: Table of contents
    :maxdepth: 2
@@ -27,8 +30,6 @@ Documentation/dev-tools/testing-overview.rst
    kmemleak
    kcsan
    kfence
-   gdb-kernel-debugging
-   kgdb
    kselftest
    kunit/index
    ktap
diff --git a/Documentation/dev-tools/gdb-kernel-debugging.rst b/Documentation/process/debugging/gdb-kernel-debugging.rst
similarity index 100%
rename from Documentation/dev-tools/gdb-kernel-debugging.rst
rename to Documentation/process/debugging/gdb-kernel-debugging.rst
diff --git a/Documentation/process/debugging/index.rst b/Documentation/process/debugging/index.rst
index f6e4a00dfee3..387d33d16f5e 100644
--- a/Documentation/process/debugging/index.rst
+++ b/Documentation/process/debugging/index.rst
@@ -11,6 +11,8 @@ general guides
    :maxdepth: 1
 
    driver_development_debugging_guide
+   gdb-kernel-debugging
+   kgdb
    userspace_debugging_guide
 
 .. only::  subproject and html
diff --git a/Documentation/dev-tools/kgdb.rst b/Documentation/process/debugging/kgdb.rst
similarity index 100%
rename from Documentation/dev-tools/kgdb.rst
rename to Documentation/process/debugging/kgdb.rst
diff --git a/MAINTAINERS b/MAINTAINERS
index 1e930c7a58b1..1753fe792d04 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12809,7 +12809,7 @@ L:	kgdb-bugreport@lists.sourceforge.net
 S:	Maintained
 W:	http://kgdb.wiki.kernel.org/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/jwessel/kgdb.git
-F:	Documentation/dev-tools/kgdb.rst
+F:	Documentation/process/debugging/kgdb.rst
 F:	drivers/misc/kgdbts.c
 F:	drivers/tty/serial/kgdboc.c
 F:	include/linux/kdb.h
diff --git a/include/linux/tty_driver.h b/include/linux/tty_driver.h
index dd4b31ce6d5d..d4cdc089f6c3 100644
--- a/include/linux/tty_driver.h
+++ b/include/linux/tty_driver.h
@@ -320,7 +320,7 @@ struct serial_struct;
  *
  * @poll_init: ``int ()(struct tty_driver *driver, int line, char *options)``
  *
- *	kgdboc support (Documentation/dev-tools/kgdb.rst). This routine is
+ *	kgdboc support (Documentation/process/debugging/kgdb.rst). This routine is
  *	called to initialize the HW for later use by calling @poll_get_char or
  *	@poll_put_char.
  *
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index f3d723705879..d2cf74cbbe70 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -433,7 +433,7 @@ config GDB_SCRIPTS
 	  build directory. If you load vmlinux into gdb, the helper
 	  scripts will be automatically imported by gdb as well, and
 	  additional functions are available to analyze a Linux kernel
-	  instance. See Documentation/dev-tools/gdb-kernel-debugging.rst
+	  instance. See Documentation/process/debugging/gdb-kernel-debugging.rst
 	  for further details.
 
 endif # DEBUG_INFO
diff --git a/lib/Kconfig.kgdb b/lib/Kconfig.kgdb
index 537e1b3f5734..8336b1a489a3 100644
--- a/lib/Kconfig.kgdb
+++ b/lib/Kconfig.kgdb
@@ -19,7 +19,7 @@ menuconfig KGDB
 	  CONFIG_FRAME_POINTER to aid in producing more reliable stack
 	  backtraces in the external debugger.  Documentation of
 	  kernel debugger is available at http://kgdb.sourceforge.net
-	  as well as in Documentation/dev-tools/kgdb.rst.  If
+	  as well as in Documentation/process/debugging/kgdb.rst.  If
 	  unsure, say N.
 
 if KGDB


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
