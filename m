Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 707889C18A9
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  8 Nov 2024 10:02:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1t9Kt8-00020y-S8
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 08 Nov 2024 09:02:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1t9Kt7-00020r-O7
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 08 Nov 2024 09:02:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eomDoovwmPoe3D4ex+kqfalwjw8M76GdHrO0gwpAifY=; b=IwSfn+zEBZSjPQBayJ7eltY+v7
 SJJOFnxulfS3KBLQyNQEv3PQXBFfiKa1HF2IEZP3/5yV9IuCCkBQt9iC1I+/BPQlQS+XgCURneH4D
 shzRm0b8/aKI+STpbgIXeU0x429SZEzPzlJZJRUvnkiI33GhR0AfAIUqjyw2WkNL13/o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date
 :Subject:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=eomDoovwmPoe3D4ex+kqfalwjw8M76GdHrO0gwpAifY=; b=Q
 QE23ZpD/yILpS/saA0Zmzmymp0WqMgqNY5+gAbTRh2Ru8jPujkwlNxZrU6Cz+C+HMZTRXIpPOBZNW
 +OR1f+meCW7jOQTpBHCKD2Tp236r8vAFf29GH0EPXr6N2Sxkm+5DBwJZt21vlSenqOTbi3TP4cy33
 CTxbtfv38K3RCcqQ=;
Received: from mail-lj1-f180.google.com ([209.85.208.180])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1t9Kt6-0001if-DD for kgdb-bugreport@lists.sourceforge.net;
 Fri, 08 Nov 2024 09:02:41 +0000
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2fb56cb61baso15105131fa.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 08 Nov 2024 01:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731056549; x=1731661349; darn=lists.sourceforge.net;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eomDoovwmPoe3D4ex+kqfalwjw8M76GdHrO0gwpAifY=;
 b=mT7yGJf/2Mb8Z0M82APTT+FfGUUFSDTBgtm3zx7CfkGA3ce39tJrEJetfJdoBChBMP
 3r49AKboC16HwuHNx1WmfZygK9H1AuOF36+zfBLvPF5uaPZHj2/kwZj6SLeuYHLkv8CR
 hTeAL5jtAMrmw/dmkqtSjp+GLgkMXuhYLfRVCjlsTZU6dDlwKYKeKW0YcioDaNJgYoYE
 UWxbP2KNw/4Y2dTKgttuxmTe8wcsA2F4IClUSfS1HY9s3/7lz/yvOCwM7oPhDXa7x8eI
 WXIt2xdHmveG0WXspQjxe7/wYGgYVJEBt3w6BxTbD6+Z3MXy3ZO89Y001wL6Y8scGf37
 2s2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731056549; x=1731661349;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eomDoovwmPoe3D4ex+kqfalwjw8M76GdHrO0gwpAifY=;
 b=sAqbyocbks7UKSiCeuI4kBvdT0iyw+YLUBZdqRX2N5NB3iGWjqCaj+U69IagKAOnfy
 wjHkgGMPYGPacfXd7zm2cTzO6v6XiAcMDk4RMbq8QCVg8XKO0dN3b7BACEbv9dz5Tzoj
 ZNL0DY+wHuRU6vAAnZOc1B3lEyDIvJSfhDy7IuSsFfaXHb7NLVoC1cSyB9Ye+cVkSE2m
 huDUhIsog9RwSF8iz9WN2//jHHlRXGT4Yc6X7eTPOg/AeDyvpL0xlG/SBYQrBr1EQO01
 z9z4OkpXn/6oT63+emE7wuz2rUax2wnNtGE0L638dg8bP0h3/ex1wTjNQ5ajpczElgl3
 6vFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOOdtdHd+aOoKTj6NTUdL6DG/hEcOe91Svhx0JuARs3Enk05i2FXGN/4Paa1ZEh46bR8QBZl5XQ7ku1OYInA==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwgsevcvvYAiH8n9OcRUh3PgH2AN9Ca4mD+7q9uFzLEz3KpktwA
 0PyrbLMmSRauFm9ATUwsVzA//673Dgc8XSVKhcKOCo58bw86hpP1eCYkjZ+8EN2s6Wy6UvSegBE
 7jOrihQ==
X-Google-Smtp-Source: AGHT+IHHJY+9cAH5llReO38ypapsMnCYY1F1ljLHtnGaUqjvCgc24E6ZfcX/bL0Vg9ze7adUU8pTuw==
X-Received: by 2002:ac2:4c41:0:b0:539:8e77:9129 with SMTP id
 2adb3069b0e04-53d862be3b0mr1011744e87.44.1731054693893; 
 Fri, 08 Nov 2024 00:31:33 -0800 (PST)
Received: from aspen.lan ([154.14.63.34]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381eda04ad0sm3876370f8f.100.2024.11.08.00.31.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 00:31:33 -0800 (PST)
From: Daniel Thompson <daniel.thompson@linaro.org>
Date: Fri, 08 Nov 2024 08:30:43 +0000
Message-Id: <20241108-new-maintainer-address-2-v1-0-47c9d71aac11@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADTMLWcC/x2MwQoCMQwFf6XkvIGmiBR/ZdlD2bzVHKySiArL/
 rvFwxzmMLNTwA1Bl7ST421hjz5EpkTrrfUr2HQ4lVxOIrlyx4fvzfprAOem6ojgwgqVlnEW3Sq
 N/OnY7Ptfz8tx/ADHucxGagAAAA==
X-Change-ID: 20241108-new-maintainer-address-2-ded1a0e61df8
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=566;
 i=daniel.thompson@linaro.org; h=from:subject:message-id;
 bh=LfuXZV5ft4NyetZM+Ia2hzJO3hj04SYKybK95hZjwW4=;
 b=owEBbQKS/ZANAwAKAXzjJV0594ihAcsmYgBnLcw8ZO3DFRnzO3TsLta1DOEJHXYLUWPOhwwrV
 flZaWazj9mJAjMEAAEKAB0WIQQvNUFTUPeVarpwrPB84yVdOfeIoQUCZy3MPAAKCRB84yVdOfeI
 oeSUD/0RmeeQTzyONBemD5YD0uKvILwDE5tqA+PYWK3h1rz5yk6n9CK8e48AN03FCicxVDRkWcp
 nriAW3c62Pe8h5Maz7TDnMqIofcYtwuYyNUCFGFUCGzb8bo4MiRISe+OicZTA0W5acjPj+BTt4c
 pK4Yr0sfavL8rHovt4r8aSA9bggxB6LmhUo0Slu3V57FCRdDqSGg56YF/nUfdD1+0NpqMiJl0Jk
 KhfYzQJGKFDWtBQnt4zrdLZ5I/+rw7JomJeUx+MVLd++SMau/Rts0Ap7S7W9G4OHaPAQqJsXe2D
 DqEwKLN+rbq8A220mxxQEKBaeWSOJbFkg3GejuIdAIPD5K+TqRNLksCYJ6Ojmez2mieFUhwNZff
 h7EBE7aOlGsRAlPL3z92LmGoqDg1hyZlIBvLf1b4WGGvM15vIQbENsSy8BupQer87LyaC+5OV2b
 Mve795O6wEIyJsk/u4tjh/E4XxxUgZYjwpitfmuZvu3mf5AvEVSaUtdyM7NqQCqvjjTLQAvvsEi
 XbgIehLK9JREU8EcX4ztuQWe7f6tGMJrK1zAMjPnnWq/Yv5EJb4n/kfwFkgW49aSJeMtCfTKxyx
 qRHrtWxji/qLVZ7t8zoXSHluJOTXF53wxNxam0xLAxBBo5Q/xliOYF4ivSSjDI1g46l5zdiEc8W
 DGMFARpJGLMd7Dw==
X-Developer-Key: i=daniel.thompson@linaro.org; a=openpgp;
 fpr=E38BE19861669213F6E2661AA8A4E3BC5B7B28BE
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Going forward,
 I'll be using my kernel.org address for upstream
 work. Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org> --- Daniel
 Thompson (2): MAINTAINERS: Use Daniel Thompson's korg address for backlight
 work MAINTAINERS: Use Daniel Thompson's korg address [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.180 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.180 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1t9Kt6-0001if-DD
Subject: [Kgdb-bugreport] [PATCH 0/2] MAINTAINERS: Update with Daniel
 Thompson's korg address
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 kgdb-bugreport@lists.sourceforge.net,
 Jason Wessel <jason.wessel@windriver.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Going forward, I'll be using my kernel.org address for upstream work.

Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
Daniel Thompson (2):
      MAINTAINERS: Use Daniel Thompson's korg address for backlight work
      MAINTAINERS: Use Daniel Thompson's korg address for kgdb work

 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
---
base-commit: 81983758430957d9a5cb3333fe324fd70cf63e7e
change-id: 20241108-new-maintainer-address-2-ded1a0e61df8

Best regards,
-- 
Daniel Thompson <daniel.thompson@linaro.org>



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
