Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9195E8AC8BC
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 22 Apr 2024 11:20:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rypqp-0008ON-2A
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 22 Apr 2024 09:20:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <thorsten.blum@toblux.com>) id 1rypqk-0008My-Dx
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 22 Apr 2024 09:20:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4Rt1DqzZQHpNrcSkrbFzv1k9hIQM6x7OmI+95yCtyQs=; b=mtWef/dGK6CIPwLDfA9Bn6/1N7
 N1wBmgg4ULqHK2alGemxKbglrOSOm+BORKZAksIG+WeWzcC2xKIn6U5VbwD3K9Lt4loiylr5ubpa2
 njOkzGXy0UtUtLft+vGcbMDIxzcgMHZhzxsFk5WukTOJcqXCxg2++f9crUKjL02RemSg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4Rt1DqzZQHpNrcSkrbFzv1k9hIQM6x7OmI+95yCtyQs=; b=VWfH4PixxBZ45CHFkTV9VJSn58
 tmYSeogNimbxaoJ0PX5wXFF2OpXY6nN/faoAE2l655WwDX8+GNuJmmJdhUFbpfk4mDpeLb16c7lu9
 zLBAuA9zQRBt6klAtjihlGTgWfpFlBS8eoaeXeqyD3Aw5aCZE4uLHOdUORN8ZM73A6Kc=;
Received: from mail-wr1-f41.google.com ([209.85.221.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rypqi-0008Gw-90 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 22 Apr 2024 09:20:33 +0000
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-3465921600dso3710881f8f.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 22 Apr 2024 02:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1713777626; x=1714382426;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4Rt1DqzZQHpNrcSkrbFzv1k9hIQM6x7OmI+95yCtyQs=;
 b=t3DnBHWNmSzF57ZIf+GRa8M/+ayOFJ6dl2B+Ic2xeOiTrY6i0NbfOv/svJGJPOsqvt
 p7MnQSYWWAlhElquRr00NM9fvplss5dkNO7L+AMoxbRJJ+ExNckELA+RjpCoyPuDzxmL
 VXKlwydZp1JIMe2XPyJoDGeD23KkTgACYu/iK3yS28qssH4Y1Nz2Rzxegd9mzm3EEoFK
 ra2aZQQ31U+ycJP7kUHEKTOVebt0WYUsW2gb7uIifo+Y/30vRxFi+L7TlA91pGkcqRHc
 SdDCEwfPNwPAdT2GpUyDRKDNiXqrHXGZKUDyuNAWm5W3ACko1P07TPDdyB5rIb3aqa3E
 zP7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713777626; x=1714382426;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4Rt1DqzZQHpNrcSkrbFzv1k9hIQM6x7OmI+95yCtyQs=;
 b=hdqHPiB0rD7uWsbNmsjCidQComARAUvBLTgS8q8N4yN4fLVW65MAd6LfHBDSjBM9M2
 3WDMSkIQERinhREzP5D+CsEn4lyxOVyAbOZlVtwdal2C8huMTFvdVbBzuK3I8yQ3zg2d
 vHDLhFboicqNQIWrObRSlMuGEV+P4A12rBpRivN8lcTYNySVuiqJeZnkcGDHeDVvKLiq
 UYxkiDqFcOYUGttEAV9HKUtNY/Nfq4suAqOBqtpFzra9Dy4jZ2k5K/Zk4dTNgOKp7rVR
 Rn01/kHsMro4ZEVNren9QWSwGa7Tv/V/ho9GCzUDqySLeEtpzTqlUx3PZgOND7gm2hzR
 aq/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtvsRWhbFgp/YNzYkT15zXXPCYwufF9RytEw264LCpU+T+O6UgSwErUYyRLHPME7JCTLGg+o/xEtMUeFVbT+rVlML0TPNS0vthog/1BKNOKjn6iRo=
X-Gm-Message-State: AOJu0Ywo2dBFw9ZFE8e/pyKleppQsP7g6U/UVK1PZR4zv8oDuGzNwrl/
 w6FBvGWhIJVybNvwR338+G03C9227mi8JH8szshqc0M76phR3NwlXPy5hBQ4TJQCwOpcFL0VadM
 BhJY=
X-Google-Smtp-Source: AGHT+IF7QX6NRCV7ovrGSxFidjCjmfTcvLkiHjj27eK6dCisOE2ZdrZ0NYqSZfXRrA/2AYtLK+SrMg==
X-Received: by 2002:a17:906:3196:b0:a52:6e3b:fcf1 with SMTP id
 22-20020a170906319600b00a526e3bfcf1mr5818778ejy.17.1713775912963; 
 Mon, 22 Apr 2024 01:51:52 -0700 (PDT)
Received: from fedora.fritz.box (aftr-82-135-80-212.dynamic.mnet-online.de.
 [82.135.80.212]) by smtp.gmail.com with ESMTPSA id
 gh16-20020a170906e09000b00a5180d5b31asm5481921ejb.32.2024.04.22.01.51.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 01:51:52 -0700 (PDT)
From: Thorsten Blum <thorsten.blum@toblux.com>
To: dianders@chromium.org
Date: Mon, 22 Apr 2024 01:26:03 +0200
Message-ID: <20240421232602.956049-2-thorsten.blum@toblux.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <CAD=FV=V3Cpo38ss1nFvPMbXadaXXpVuN5jdfUKZS4ngDLQX_wQ@mail.gmail.com>
References: <CAD=FV=V3Cpo38ss1nFvPMbXadaXXpVuN5jdfUKZS4ngDLQX_wQ@mail.gmail.com>
MIME-Version: 1.0
X-Spam-Score: -3.9 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Fixes the following Coccinelle/coccicheck warning reported
 by string_choices.cocci: opportunity for str_plural(days) Signed-off-by:
 Thorsten Blum <thorsten.blum@toblux.com> Reviewed-by: Douglas Anderson
 <dianders@chromium.org>
 --- kernel/debug/kdb/kdb_main.c | 2 +- 1 file changed, 1 insertion(+), 1
 deletion(-) 
 Content analysis details:   (-3.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.85.221.41 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 1.1 DATE_IN_PAST_06_12     Date: is 6 to 12 hours before Received: date
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.41 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1rypqi-0008Gw-90
Subject: [Kgdb-bugreport] [RESEND PATCH] kdb: Use str_plural() to fix
 Coccinelle warning
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
Cc: daniel.thompson@linaro.org, kgdb-bugreport@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, thorsten.blum@toblux.com,
 christophe.jaillet@wanadoo.fr, jason.wessel@windriver.com,
 yuran.pereira@hotmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Fixes the following Coccinelle/coccicheck warning reported by
string_choices.cocci:

	opportunity for str_plural(days)

Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 kernel/debug/kdb/kdb_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index d05066cb40b2..664bae55f2c9 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -2517,7 +2517,7 @@ static int kdb_summary(int argc, const char **argv)
 	if (val.uptime > (24*60*60)) {
 		int days = val.uptime / (24*60*60);
 		val.uptime %= (24*60*60);
-		kdb_printf("%d day%s ", days, days == 1 ? "" : "s");
+		kdb_printf("%d day%s ", days, str_plural(days));
 	}
 	kdb_printf("%02ld:%02ld\n", val.uptime/(60*60), (val.uptime/60)%60);
 
-- 
2.44.0



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
