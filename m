Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBF01B31D5
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 21 Apr 2020 23:22:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jR0Lm-00072q-5m
	for lists+kgdb-bugreport@lfdr.de; Tue, 21 Apr 2020 21:22:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jR0LR-000729-Oe
 for kgdb-bugreport@lists.sourceforge.net; Tue, 21 Apr 2020 21:22:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aFTviJPrKuTMM7A/RFhxVuMj7vnHygi6BZ20JfR32qQ=; b=jPil7G4TwAuluF/POl0eh4cMvw
 +0/T/4DzhRHaMp+YFePZBrDn872dDION8xftvjtffPbYm/3KTtkMHDDgvsbnv8sR1B7KZrn614mCY
 xenrdHwfHZfz4mOKIn8H4GpRs9GkA/75Vh05y3NTG/waXDq8wiLH0vshRcwURapNefIQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aFTviJPrKuTMM7A/RFhxVuMj7vnHygi6BZ20JfR32qQ=; b=R1Cc3elOLBccsYD1irQmBxykOG
 kDGslRTkP11jIWmyGtIoB/K08fCt1O462mdunxTP/JsUR1QK83XfCuOE74ppnO87KGtOZCZ3MaiYa
 tEM8lIuQ95769nX5//0To0WSG1FUrdS4GGQT2qStxXH7MDRKHyuIC/DwC4ksQN0HGlEU=;
Received: from mail-il1-f196.google.com ([209.85.166.196])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jR0LQ-005hXf-8J
 for kgdb-bugreport@lists.sourceforge.net; Tue, 21 Apr 2020 21:22:17 +0000
Received: by mail-il1-f196.google.com with SMTP id s10so14061724iln.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 21 Apr 2020 14:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aFTviJPrKuTMM7A/RFhxVuMj7vnHygi6BZ20JfR32qQ=;
 b=DJykRx+tWWAumEWwnSE3iLPH/LZN5hsuI9JxuBHfkBbrifQ+PTh/SAy2vB0gT+4ZGT
 41raTO+9jGi733au3YEoRUgZ+wWSdTJP4kiLGz5Yb/9nmsQWucxZEds8LBLzz7IE++R4
 rwed5Me4aZ97tVLFx2HbojUAkouKfjL/0tU3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aFTviJPrKuTMM7A/RFhxVuMj7vnHygi6BZ20JfR32qQ=;
 b=hHyLVb+pwk5aLFBZwSioEo6o75wC5j4dgNxo1/MC9SKXw7bXQhDeMsqtd0SeEGrmMM
 nhRuOo+XV5kLXO88Ua2qbeDippZXvwwqm0Vc91EsQHsDqFOQPwBMDT8o4cWsbA/d/3OZ
 kU9zOijxEWZCFZmbi36Or4IDpemNfLB6Big4rJyCYabOcCpit5YoknKE5MZQMzryvf2D
 Hm+3mbul1lMILhx3rAxoV8FLtHvJBJvPcu9vgBvEh99UVJgohsGv5sq46v18ipU4E8HP
 2D/bGdYQhLF45JpvFfHZQR8CyObLSI5jbWXp3sty47ArfhBCtTMsY9wMt3GHZGObXK3v
 5dpg==
X-Gm-Message-State: AGi0PuacDg6TjkMJ9ZUjzqJooosjnzX7YUodLAdO9asVFRtPjSPBbZX4
 ENzsNEJAV5oJHJapPaUsX5e/mAa+sV6nZg==
X-Google-Smtp-Source: APiQypLAD11AV9Mkwm3S1Q5SGQ1l09QLFYenxp/jtXM3LJz9RnpH2GYoSx8jPUB+F6dCGtfle08i1Q==
X-Received: by 2002:a63:1506:: with SMTP id v6mr24334707pgl.365.1587503728073; 
 Tue, 21 Apr 2020 14:15:28 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id c1sm3287880pfo.152.2020.04.21.14.15.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 14:15:27 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: jason.wessel@windriver.com, daniel.thompson@linaro.org,
 gregkh@linuxfoundation.org
Date: Tue, 21 Apr 2020 14:14:45 -0700
Message-Id: <20200421141234.v2.7.I7d5eb42c6180c831d47aef1af44d0b8be3fac559@changeid>
X-Mailer: git-send-email 2.26.1.301.g55bc3eb7cb9-goog
In-Reply-To: <20200421211447.193860-1-dianders@chromium.org>
References: <20200421211447.193860-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.196 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.196 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jR0LQ-005hXf-8J
Subject: [Kgdb-bugreport] [PATCH v2 7/9] Documentation: kgdboc: Document new
 earlycon_kgdboc parameter
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
 Borislav Petkov <bp@suse.de>, Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

The recent patch ("kgdboc: Add earlycon_kgdboc to support early kgdb
using boot consoles") adds a new kernel command line parameter.
Document it.

Note that the patch adding the feature does some comparing/contrasting
of "earlycon_kgdboc" vs. the existing "ekgdboc".  See that patch for
more details, but briefly "ekgdboc" can be used _instead_ of "kgdboc"
and just makes "kgdboc" do its normal initialization early (only works
if your tty driver is already ready).  The new "earlycon_kgdboc" works
in combination with "kgdboc" and is backed by boot consoles.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2: None

 .../admin-guide/kernel-parameters.txt         | 20 +++++++++++++++++++
 Documentation/dev-tools/kgdb.rst              | 14 +++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index f2a93c8679e8..588625ec2993 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1132,6 +1132,22 @@
 			address must be provided, and the serial port must
 			already be setup and configured.
 
+	earlycon_kgdboc=	[KGDB,HW]
+			If the boot console provides the ability to read
+			characters and can work in polling mode, you can use
+			this parameter to tell kgdb to use it as a backend
+			until the normal console is registered. Intended to
+			be used together with the kgdboc parameter which
+			specifies the normal console to transition to.
+
+			The the name of the early console should be specified
+			as the value of this parameter. Note that the name of
+			the early console might be different than the tty
+			name passed to kgdboc. If only one boot console with
+			a read() function is enabled it's OK to leave the
+			value blank and the first boot console that implements
+			read() will be picked.
+
 	earlyprintk=	[X86,SH,ARM,M68k,S390]
 			earlyprintk=vga
 			earlyprintk=sclp
@@ -1190,6 +1206,10 @@
 			This is designed to be used in conjunction with
 			the boot argument: earlyprintk=vga
 
+			This parameter works in place of the kgdboc parameter
+			but can only be used if the backing tty is available
+			very early in the boot process.
+
 	edd=		[EDD]
 			Format: {"off" | "on" | "skip[mbr]"}
 
diff --git a/Documentation/dev-tools/kgdb.rst b/Documentation/dev-tools/kgdb.rst
index d38be58f872a..c0b321403d9a 100644
--- a/Documentation/dev-tools/kgdb.rst
+++ b/Documentation/dev-tools/kgdb.rst
@@ -274,6 +274,20 @@ don't like this are to hack gdb to send the :kbd:`SysRq-G` for you as well as
 on the initial connect, or to use a debugger proxy that allows an
 unmodified gdb to do the debugging.
 
+Kernel parameter: ``earlycon_kgdboc``
+-------------------------------------
+
+If you specify the kernel parameter ``earlycon_kgdboc`` and your serial
+driver registers a boot console that supports polling (doesn't need
+interrupts and implements a nonblocking read() function) kgdb will attempt
+to work using the boot console until it can transition to the regular
+tty driver specified by the ``kgdboc`` parameter.
+
+Normally there is only one boot console (especially that implements the
+read() function) so just adding ``earlycon_kgdboc`` on its own is
+sufficient to make this work.  If you have more than one boot console you
+can add the boot console's name to differentiate.
+
 Kernel parameter: ``kgdbwait``
 ------------------------------
 
-- 
2.26.1.301.g55bc3eb7cb9-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
