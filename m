Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA791C9C77
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  7 May 2020 22:33:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jWnDH-0003QL-7z
	for lists+kgdb-bugreport@lfdr.de; Thu, 07 May 2020 20:33:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jWnDG-0003Q9-7E
 for kgdb-bugreport@lists.sourceforge.net; Thu, 07 May 2020 20:33:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JZVfMDRlaZxQ6qpzAMsiTzN4YCAYznWKH75NGk0mLe0=; b=N1OYtad/KhQ3cMTFFUBJGk59j5
 eb4VH00SqN6cVGHU7xNXyZC4kNuNuz6NtDkZ1GfEbaD1W0Y6lE785Bgll1jsO84me+Fkw3/k+Vu/b
 Lv2wx7L9nqVlVLEicSLvcGyBGP9Rb6IroduH/iCPEonM7VHki9gdeXUFBBsSygi2/Pxs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JZVfMDRlaZxQ6qpzAMsiTzN4YCAYznWKH75NGk0mLe0=; b=CSCeYx8BsnJWMxjbCUeQZ+JzTe
 bYckqRplnpw/PeGqCuLhL7WRSWtP6BCaPNx7EWEGnmaS3kfbpivxqdU0EaNN/WBvM/nlWieQE85dn
 509mbC1iWxB7FkqS3kqnV5kh3rLTFxkhgFShGMo09r6E5pgE2AHSZMMHsgHBV9xbsloM=;
Received: from mail-pj1-f67.google.com ([209.85.216.67])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jWnDD-00Bd1o-SQ
 for kgdb-bugreport@lists.sourceforge.net; Thu, 07 May 2020 20:33:46 +0000
Received: by mail-pj1-f67.google.com with SMTP id fu13so3150670pjb.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 07 May 2020 13:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JZVfMDRlaZxQ6qpzAMsiTzN4YCAYznWKH75NGk0mLe0=;
 b=m5ylYMv87Zesz+z8ZAznR4kWc9TIjqXmxiLRRY8QyOpCZOwt00FTXHCWaihQzLwGTB
 /kjZ0p7FzdVuwoHXJtcPF3yVROz9sUTpYmZCbApuKUmPUpqHuEyGNlO3TyZwioK9zYWZ
 M773j7obrswcIlQPjJ858TSOKYbtG52zYMVnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JZVfMDRlaZxQ6qpzAMsiTzN4YCAYznWKH75NGk0mLe0=;
 b=TprGGUuGJuAg5RgupNLg88oLDfkKsSCrOKQrk67mttrr86zOYl90K4FKnZrx1qZrAD
 k6oWvgMoKH1Nm4ZvGM92Nx83sVDKn7faUyH723HQKNJ00Ts1FHHXkk0NcTmTaDNLwicg
 b+OxYzIZpjBxRfoPrROWj7L9sJx/MstEZ5RzwkIoA5LCQXEAJ4r+nv2YNHK1c3SJTqfI
 sEX0jddUBnhH9Elnpf5/FVZH5jATR6/WbXT1KW8EXjdgzHe5/3Y5gQah/9OjdSvlUi6Y
 10swIGv2y2mggWf4k9NPUbE37dnOWItLbTFRkmfWhkCQOic5dnxhvMMe32eybNx8gF1K
 j22w==
X-Gm-Message-State: AGi0PuZ1WR2wqHLAImZ71DLnTpj5TXzNAfX4SQRxGxtaMUX9KOE/ZLY5
 MjkG4ux6KEietOkN8tStjAd15DyfwXItnQ==
X-Google-Smtp-Source: APiQypJWVjHYI0dqkVdBU1DEnnSramGm6bwNGEmhZQc/6xZdlZXzI9QuauPG2Tcya5C3/lJNRD27RQ==
X-Received: by 2002:a17:902:c193:: with SMTP id
 d19mr15373854pld.60.1588882152281; 
 Thu, 07 May 2020 13:09:12 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id d203sm5547601pfd.79.2020.05.07.13.09.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 13:09:11 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: jason.wessel@windriver.com, daniel.thompson@linaro.org,
 gregkh@linuxfoundation.org
Date: Thu,  7 May 2020 13:08:47 -0700
Message-Id: <20200507130644.v4.9.I7d5eb42c6180c831d47aef1af44d0b8be3fac559@changeid>
X-Mailer: git-send-email 2.26.2.645.ge9eca65c58-goog
In-Reply-To: <20200507200850.60646-1-dianders@chromium.org>
References: <20200507200850.60646-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.67 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jWnDD-00Bd1o-SQ
Subject: [Kgdb-bugreport] [PATCH v4 09/12] Documentation: kgdboc: Document
 new kgdboc_earlycon parameter
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
Cc: Juergen Gross <jgross@suse.com>, catalin.marinas@arm.com, will@kernel.org,
 corbet@lwn.net, kgdb-bugreport@lists.sourceforge.net, jslaby@suse.com,
 linux-doc@vger.kernel.org, agross@kernel.org, bjorn.andersson@linaro.org,
 mingo@redhat.com, bp@alien8.de, linux-serial@vger.kernel.org, hpa@zytor.com,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, tglx@linutronix.de,
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

The recent patch ("kgdboc: Add kgdboc_earlycon to support early kgdb
using boot consoles") adds a new kernel command line parameter.
Document it.

Note that the patch adding the feature does some comparing/contrasting
of "kgdboc_earlycon" vs. the existing "ekgdboc".  See that patch for
more details, but briefly "ekgdboc" can be used _instead_ of "kgdboc"
and just makes "kgdboc" do its normal initialization early (only works
if your tty driver is already ready).  The new "kgdboc_earlycon" works
in combination with "kgdboc" and is backed by boot consoles.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
---

Changes in v4:
- s/The the/The/

Changes in v3:
- Added example in kgdb.rst
- Removed unneeded sentence in kerenel-parameters doc.
- Renamed earlycon_kgdboc to kgdboc_earlycon.
- Suggest people use kgdboc_earlycon instead of ekgdboc.

Changes in v2: None

 .../admin-guide/kernel-parameters.txt         | 20 ++++++++++++++++
 Documentation/dev-tools/kgdb.rst              | 24 +++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 7bc83f3d9bdf..2cbde9ea476d 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1190,6 +1190,11 @@
 			This is designed to be used in conjunction with
 			the boot argument: earlyprintk=vga
 
+			This parameter works in place of the kgdboc parameter
+			but can only be used if the backing tty is available
+			very early in the boot process. For early debugging
+			via a serial port see kgdboc_earlycon instead.
+
 	edd=		[EDD]
 			Format: {"off" | "on" | "skip[mbr]"}
 
@@ -2105,6 +2110,21 @@
 			 kms, kbd format: kms,kbd
 			 kms, kbd and serial format: kms,kbd,<ser_dev>[,baud]
 
+	kgdboc_earlycon=	[KGDB,HW]
+			If the boot console provides the ability to read
+			characters and can work in polling mode, you can use
+			this parameter to tell kgdb to use it as a backend
+			until the normal console is registered. Intended to
+			be used together with the kgdboc parameter which
+			specifies the normal console to transition to.
+
+			The name of the early console should be specified
+			as the value of this parameter. Note that the name of
+			the early console might be different than the tty
+			name passed to kgdboc. It's OK to leave the value
+			blank and the first boot console that implements
+			read() will be picked.
+
 	kgdbwait	[KGDB] Stop kernel execution and enter the
 			kernel debugger at the earliest opportunity.
 
diff --git a/Documentation/dev-tools/kgdb.rst b/Documentation/dev-tools/kgdb.rst
index d38be58f872a..61293f40bc6e 100644
--- a/Documentation/dev-tools/kgdb.rst
+++ b/Documentation/dev-tools/kgdb.rst
@@ -274,6 +274,30 @@ don't like this are to hack gdb to send the :kbd:`SysRq-G` for you as well as
 on the initial connect, or to use a debugger proxy that allows an
 unmodified gdb to do the debugging.
 
+Kernel parameter: ``kgdboc_earlycon``
+-------------------------------------
+
+If you specify the kernel parameter ``kgdboc_earlycon`` and your serial
+driver registers a boot console that supports polling (doesn't need
+interrupts and implements a nonblocking read() function) kgdb will attempt
+to work using the boot console until it can transition to the regular
+tty driver specified by the ``kgdboc`` parameter.
+
+Normally there is only one boot console (especially that implements the
+read() function) so just adding ``kgdboc_earlycon`` on its own is
+sufficient to make this work. If you have more than one boot console you
+can add the boot console's name to differentiate. Note that names that
+are registered through the boot console layer and the tty layer are not
+the same for the same port.
+
+For instance, on one board to be explicit you might do::
+
+   kgdboc_earlycon=qcom_geni kgdboc=ttyMSM0
+
+If the only boot console on the device was "qcom_geni", you could simplify::
+
+   kgdboc_earlycon kgdboc=ttyMSM0
+
 Kernel parameter: ``kgdbwait``
 ------------------------------
 
-- 
2.26.2.645.ge9eca65c58-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
