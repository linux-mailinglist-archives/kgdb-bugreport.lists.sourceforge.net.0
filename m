Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6057E8994BF
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  5 Apr 2024 07:32:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rscBW-0003z9-NB
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 05 Apr 2024 05:32:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3F2MPZgsKAFI3ECD27CD2DD08805y.w86@flex--justinstitt.bounces.google.com>)
 id 1rscBU-0003z3-OP for kgdb-bugreport@lists.sourceforge.net;
 Fri, 05 Apr 2024 05:32:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iwbHBqeRFEUfVJ+3aD1i4LMY2bXuO8BYqPMFzWHirHE=; b=Nm3CKsUSBzfP3YChwHJ0rI0gqh
 CJ4ygCB0buBYN+lIOtDeCmUrwYRNXNyIaJKcbkm/pU/rsE5M3JpPvWe/x3SFdfiOnYgYnAcNlQmmO
 RxNs7pQaGG0LIItb4+fxLu3X7xmHILyYeIFXZPbQ88lK/wdifhWG02ODkqwQIN31HR5Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=iwbHBqeRFEUfVJ+3aD1i4LMY2bXuO8BYqPMFzWHirHE=; b=S
 and3sst7GtjYPERzkTGEEXwjxPfHvx9zIDzkQ0QKtTp5ciXRNt+DPIz1N5nGMmdOqnbq7kn844SEQ
 JRpHxlasKNmnLCsvTCUWyTnZU/FaKxMZiDsRAFnEgnO456x/0Js6mJhk3YVUg+quc28v7mWb5s6Y9
 WcYYtOa+Ry2Bd6iE=;
Received: from mail-pj1-f74.google.com ([209.85.216.74])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rscBS-0003Th-M0 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 05 Apr 2024 05:32:16 +0000
Received: by mail-pj1-f74.google.com with SMTP id
 98e67ed59e1d1-2a367a1c4c2so322368a91.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 04 Apr 2024 22:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1712295124; x=1712899924;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=iwbHBqeRFEUfVJ+3aD1i4LMY2bXuO8BYqPMFzWHirHE=;
 b=zAqLo9QcJdpOPKGvxcpBQnUPogR/lcZ3FE+M+h+ho366+qgiaDWOaqKf431UlPi1iB
 zacjizBeeQZ/5hs9AzbtT31fZToUFhuAJ4Gy72gkl/4PbD3fb9bgVREPreKRzbtQKt27
 YLKk0wDiCLcqI5pUG+49oEnqQinKXxsBCc2iRVsnVFppLME+K2pmRwLzF0cvRHDt01PI
 +fZiEqG/aIeP5SBglzjq4cfhIqYaXQjtccHYqWFFPk/PumMd5f4WKRyPU594fT8pIm03
 MgimoMxImKBiVahUmE3R9tyJjB0sU/zEPEnnLTmQm4pu0TeIqHP+54Rz95aEt4VPxF+l
 c2PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712295124; x=1712899924;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iwbHBqeRFEUfVJ+3aD1i4LMY2bXuO8BYqPMFzWHirHE=;
 b=OEeB1tIKC8WcIkCN/IsewQUcP81+SPFSWRJPwOf2gopRrAcJk4YvkGIi3KOeAi4McK
 5sBnSY3MMfBGApm4YddDildTuEXQlVhQxEHMVYyk/K0tKKDjHx1mKH7G7mWMuO2Fvj6i
 0ACfZ8v2ccswE5kfqLJPU/ihglwbSDbaonzwz/bIhsrpdkGkip2wZQAEUozcgVpQ1Ikc
 EnxlSVg+5HJe/qQqVM5K3dNua5SfTqFku5uyacE2wdvBZa4vO56PNjTaooP2b5ZRFj0x
 NbLHOZ/I3V/k24gmvmBn3t5R9GRI1Yo6enQZLmsTjE30WsZOx+jJWBvbR71vxvtvlQX7
 Jkhg==
X-Gm-Message-State: AOJu0Yx9uDjwz85FdeBSZ9PzMuAip3HfHpsMA1dOiygKk4HdkjCYKPkt
 OKgVUcOyb+UXQ7hqelTEiwjchQObwD3OKQ3Ike7HtCNrvzh3Fhpi2+2E3ny3ampDg1TAPcf1FFQ
 IWKoFuwxUkz8aqbaHf1q6OQ==
X-Google-Smtp-Source: AGHT+IEZvT3gn3hf4hHPSv3p3Ssos4Ig8JcIIIdsmab32//XdptkM2Ej7aJXeeyV6n+4mylECLbx+EvZkt8mAqr8xw==
X-Received: from jstitt-linux1.c.googlers.com
 ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a05:6902:100a:b0:dc6:c94e:fb85 with
 SMTP id w10-20020a056902100a00b00dc6c94efb85mr476ybt.2.1712284439335; Thu, 04
 Apr 2024 19:33:59 -0700 (PDT)
Date: Fri, 05 Apr 2024 02:33:58 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABVjD2YC/42NwQ6CMBAFf4X07JpSQNCT/2GIgXZbNmBLWiQSw
 r9bSLx7eId5h5mVBfSEgd2SlXmcKZCzEcQpYbJrrEEgFZkJLnKecwFh8laOC/ToLQ6gsH0b6FW
 770kOJBQZFqjERTWZYtEzetT0ORqPOnJHYXJ+OZJzur8/e/aHfU4hhVKXVcMrvGqd341zZsCzd
 C9Wb9v2BejKJwHTAAAA
X-Developer-Key: i=justinstitt@google.com; a=ed25519;
 pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712284438; l=2619;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=wO+X3saS4uyVLQDMRU+NaQhCLOWmvrK0q75shb6+LmM=;
 b=uqRBHljMePkjFgGA0deBKFCE5V0apxMiuEMkeOwlan7tyHSjXUKzCeg0mE+95hPCVFwwbSokl
 ESs9XgcTc+DDjmV0K//0Bq6uIuu5zDuqfFSrMH8KvRmXFvYxKVLM0j2
X-Mailer: b4 0.12.3
Message-ID: <20240405-strncpy-kernel-debug-kdb-kdb_io-c-v2-1-d0bf595ab301@google.com>
To: Jason Wessel <jason.wessel@windriver.com>, 
 Daniel Thompson <daniel.thompson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: We should move away from using strncpy because it is
 deprecated
 [1]. Since these buffers want to be NUL-terminated, let's use strscpy() which
 guarantees this behavior. The code in question enables the visual autocomplete
 when using kdb tab completion. After pressing tab a couple times when sitting
 on a partial symbol it will attempt to fill it in. In my testing, str [...]
 Content analysis details:   (-7.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 welcome-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.74 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.74 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1rscBS-0003Th-M0
Subject: [Kgdb-bugreport] [PATCH v2] kdb: replace deprecated strncpy
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
From: Justin Stitt via Kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>
Reply-To: Justin Stitt <justinstitt@google.com>
Cc: kgdb-bugreport@lists.sourceforge.net, Justin Stitt <justinstitt@google.com>,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

We should move away from using strncpy because it is deprecated [1].

Since these buffers want to be NUL-terminated, let's use strscpy() which
guarantees this behavior.

The code in question enables the visual autocomplete when using kdb tab
completion. After pressing tab a couple times when sitting on a partial
symbol it will attempt to fill it in. In my testing, strscpy() provides
the exact same autocomplete behavior that strncpy() provides here (i.e:
it fills in the same number of characters for the user).

You can confirm this by enabling kdb [3] and booting up the kernel. I
performed my tests with qemu with this incantation (wow these get long):

$ /usr/bin/qemu-system-x86_64 -display none -nodefaults -cpu Nehalem
-append 'console=ttyS0,115200 earlycon=uart8250,io,0x3f8 rdinit=/bin/sh
kgdboc=ttyS0,115200 nokaslr' -kernel $BUILD_DIR/arch/x86/boot/bzImage
-initrd $REPOS/boot-utils/images/x86_64/rootfs.cpio -m 512m -serial
mon:stdio

... then you can type some symbols and see that autocomplete still kicks
in and performs exactly the same.

For example:
tes <tab><tab> gives you "test",
then "test_ap" <tab><tab> gives you "test_aperfmperf"

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
Link: https://github.com/KSPP/linux/issues/90 [2]
Link: https://www.kernel.org/doc/html/v5.0/dev-tools/kgdb.html#using-kdb [3]
Cc: linux-hardening@vger.kernel.org
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Changes in v2:
- use strscpy over memcpy (thanks Daniel T.)
- Link to v1: https://lore.kernel.org/r/20240403-strncpy-kernel-debug-kdb-kdb_io-c-v1-1-7f78a08e9ff4@google.com
---
---
 kernel/debug/kdb/kdb_io.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index 9443bc63c5a2..60be22132020 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -368,9 +368,9 @@ static char *kdb_read(char *buffer, size_t bufsize)
 			kdb_printf("%s", buffer);
 		} else if (tab != 2 && count > 0) {
 			len_tmp = strlen(p_tmp);
-			strncpy(p_tmp+len_tmp, cp, lastchar-cp+1);
+			strscpy(p_tmp+len_tmp, cp, lastchar-cp+1);
 			len_tmp = strlen(p_tmp);
-			strncpy(cp, p_tmp+len, len_tmp-len + 1);
+			strscpy(cp, p_tmp+len, len_tmp-len + 1);
 			len = len_tmp - len;
 			kdb_printf("%s", cp);
 			cp += len;

---
base-commit: 026e680b0a08a62b1d948e5a8ca78700bfac0e6e
change-id: 20240402-strncpy-kernel-debug-kdb-kdb_io-c-53e5ed26da3d

Best regards,
--
Justin Stitt <justinstitt@google.com>



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
