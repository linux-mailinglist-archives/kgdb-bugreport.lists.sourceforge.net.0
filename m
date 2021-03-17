Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 038A333EEA0
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 17 Mar 2021 11:47:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lMTi7-0007ff-Pj
	for lists+kgdb-bugreport@lfdr.de; Wed, 17 Mar 2021 10:47:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <unixbhaskar@gmail.com>) id 1lMTi6-0007fU-FH
 for kgdb-bugreport@lists.sourceforge.net; Wed, 17 Mar 2021 10:47:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bs1Q5g0mJLEbGGh58yL+AT4vNC2vLfU22G2nRXL8Mfg=; b=PixRbAEPcNAs2mSk2qSe0Er0mW
 RPV8jGrXAESS4Dktsf5O7E39c8EPM5hbO5Kn7Tk+TCJQG3J2uiV8mV39s+UTG8yQOLj9AnHG7YoEm
 t70Fz4YoWc/xYiq6epdleXp3fBmswytL1tnmIXfRbN+qtInWZVaiLlZj7CVTHJf3P2Co=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=bs1Q5g0mJLEbGGh58yL+AT4vNC2vLfU22G2nRXL8Mfg=; b=Q
 TEe2biGTgHohDieEFj5DkSiKz6CgvrY9huQ+QAN2nhHP1qo9h5N/aEQN1VUo3YysIIMGxj7iiepUa
 WzByf3EwhTdx0OXXmBMAAZ4OkpPTHOy2r95oAHkG8925JZCrhOxWI22AjBWyu8/v1ZJATa5VbgGLl
 TRP+hTjcdmSDy+Qw=;
Received: from mail-qk1-f169.google.com ([209.85.222.169])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lMTi1-0007CQ-Tz
 for kgdb-bugreport@lists.sourceforge.net; Wed, 17 Mar 2021 10:47:30 +0000
Received: by mail-qk1-f169.google.com with SMTP id s7so38322907qkg.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 17 Mar 2021 03:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bs1Q5g0mJLEbGGh58yL+AT4vNC2vLfU22G2nRXL8Mfg=;
 b=rjpkreI3fz3jPXKCqFOFthJa4IWtHhHNUIE960EZGm0wz6/iEBpf9Kti6vth6U0fYH
 QkajKm+29I/CLF44XMSwWg0vvzsPF2Of+pjxGICTd0/ahuv5jaEFYx3DbqQxSkCpJsC2
 V1MGfL/fsUjIgRBSRw/RnRR2jyhftR594DOH6ElKqMNvQG+tzJ8M9Ve9WxWsxY3e5jSA
 adj+hMLgLnEmirW+FSPAV/lWxDVijWfAmwYXzchkMjzWdV0e7NPZHotWE/Anlag64Qet
 Dup7FcnX+BD/Sd2TCYfp3FCFDycr5p3FrLpDfUZSZ09Uhqtw3/CmNVgQm4SzXB2tBtvd
 s1Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bs1Q5g0mJLEbGGh58yL+AT4vNC2vLfU22G2nRXL8Mfg=;
 b=V0pSKsktDhn5b43fpz+Sq7OFmIwsAM6GemzTZ376AyDGTRNSeZ13Fi6qJAOesfJO/z
 S+YzyxCgRkIxeIwqByKu4UbpghTG7x3HpB5eQc+MWTV7ZPm3uwAZkAP44/q8g7X+HzhP
 v43vxF4lRLxoKV6oXJ6DpwZaHirW+9OOnUO/9XsLvp5dzfCQBSHUmjcIDLQBp+4LdRxY
 kAw7nGAOuPpjIMmWmytvEs1ZMliUTazxxE3KZa83TJFZbJkudIzhu4q8xAwoAG+AxpV4
 /L+zbOyh1Mrj6S8R+NsRNdBhPQZ3SidCxDf9D53DOlB1PgmPi75/K6JDMoW143kRZiuw
 9MZQ==
X-Gm-Message-State: AOAM531YTf8gB8Mu7i9nPqoBkvNWTEV+7UPZ+3h/9UrapZ5aEp733Bzw
 0/NGtxOCCtzL3ZRWAv+Q54U=
X-Google-Smtp-Source: ABdhPJyjQzim5Yrx4E0q3U49DYJHiESpkdVA5RAIGQslWZMeD+9GAtYJ6WUjoK4QiojCq0eoCrvgnA==
X-Received: by 2002:a05:620a:102f:: with SMTP id
 a15mr4183666qkk.87.1615978040214; 
 Wed, 17 Mar 2021 03:47:20 -0700 (PDT)
Received: from localhost.localdomain ([37.19.198.48])
 by smtp.gmail.com with ESMTPSA id b10sm8881359qkg.50.2021.03.17.03.47.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 03:47:19 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: jason.wessel@windriver.com, daniel.thompson@linaro.org,
 dianders@chromium.org, kgdb-bugreport@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
Date: Wed, 17 Mar 2021 16:16:58 +0530
Message-Id: <20210317104658.4053473-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Spam-Score: 3.5 (+++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (unixbhaskar[at]gmail.com)
 3.6 RCVD_IN_SBL_CSS        RBL: Received via a relay in Spamhaus SBL-CSS
 [37.19.198.48 listed in zen.spamhaus.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.169 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.169 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lMTi1-0007CQ-Tz
Subject: [Kgdb-bugreport] [PATCH V2] kernel: debug: Ordinary typo fixes in
 the file gdbstub.c
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
Cc: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

s/overwitten/overwritten/
s/procesing/processing/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
Changes from V1:
 As Daniel pointed out, I was misdoing a check,so corrected

 kernel/debug/gdbstub.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/debug/gdbstub.c b/kernel/debug/gdbstub.c
index e149a0ac9e9e..8372897402f4 100644
--- a/kernel/debug/gdbstub.c
+++ b/kernel/debug/gdbstub.c
@@ -321,7 +321,7 @@ int kgdb_hex2long(char **ptr, unsigned long *long_val)
 /*
  * Copy the binary array pointed to by buf into mem.  Fix $, #, and
  * 0x7d escaped with 0x7d. Return -EFAULT on failure or 0 on success.
- * The input buf is overwitten with the result to write to mem.
+ * The input buf is overwritten with the result to write to mem.
  */
 static int kgdb_ebin2mem(char *buf, char *mem, int count)
 {
@@ -952,7 +952,7 @@ static int gdb_cmd_exception_pass(struct kgdb_state *ks)
 }

 /*
- * This function performs all gdbserial command procesing
+ * This function performs all gdbserial command processing
  */
 int gdb_serial_stub(struct kgdb_state *ks)
 {
--
2.30.2



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
