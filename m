Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D96DB62D053
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 17 Nov 2022 02:00:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ovTGB-0007pL-Ky
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 17 Nov 2022 01:00:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1ovTGA-0007pF-7y
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 17 Nov 2022 01:00:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=S3aBmIu2GAscMgHpQ7LhFXU7lgU27PZREOd7olyT2fU=; b=MwpOzEQvj6Q1FETJWwg1Z9zKsc
 4R7RBIt3QElgZ/s+DXmaf15TRmuVUzOCvgvo/8rGbw0EA5Psk6MizJ9qnh53weMZIUFq3mQq+KPXv
 QWRKzeAwbOBWxGBPnLktjMjoKSFjPeOCGf3fqtsAcBXnHvQjXWWI1PJ8CDbJuGpujsBQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=S3aBmIu2GAscMgHpQ7LhFXU7lgU27PZREOd7olyT2fU=; b=MGuoKMHleQm7hLbdZC86nuIjNO
 h5zyDoXXWpsFrVlqbgib7O+Csxcm0kCygnOKZ5ZM89gcIPe0p+Hx0iamson8y4iT2nfRhOT51asJm
 4JS2+Yx/hIl1VJ02IYjg7OwrvToXpz6Z0AYcAS7XD1UPbJkzQb++wJKsvYhzQlEP6olU=;
Received: from mail-ed1-f41.google.com ([209.85.208.41])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ovTG6-00AvCj-SC for kgdb-bugreport@lists.sourceforge.net;
 Thu, 17 Nov 2022 01:00:06 +0000
Received: by mail-ed1-f41.google.com with SMTP id x102so463103ede.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 16 Nov 2022 17:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=S3aBmIu2GAscMgHpQ7LhFXU7lgU27PZREOd7olyT2fU=;
 b=cQo2wWyM06EVhdkBIbXN7wK/eL8GGmlXPWa671OgKIkSJAo5mfPZxWgsvUbSuS5Y9O
 64VIx5AItYZhftFYyU3QvyBdu+R87tzyVAN9WJ0ezn0BtGZtzVEyJYvRRGcm39bf0aPT
 x/LlPLBLDswwczVy2LPICOflUw2V4MQFz1BYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S3aBmIu2GAscMgHpQ7LhFXU7lgU27PZREOd7olyT2fU=;
 b=NEbFPHH6xLvFNyTMq7bQRF0X/9hGnnMLK1ZhpgiTyHc/DtLVRrtb/bl9FvjdKpUGey
 yR1G3al+IfXRi48DuSQRv9FrPNiVFDUWbRoGUUcdx8nDC8ZPsg5WFDJB+iZrcT/3nUFS
 iLRLctLi+Fhs63IBWUp2AsctsWSaV6Y8WAL7eicaCtSO3sy+MqWbl5G8SKZGVzwoFtxR
 hEeLj7WbRp1KEL0XLw6fgQirtGGMd95N+pHSOR8i5CUm5Q1VrdOM8DrPwACEjEll8bSM
 3hY8kPuDSTHGuUTfsliWlK5JGq1jqwNPwamI4M6HAJ47Hx5W3v/gR0tnLf4vpbGEWUGp
 xKJA==
X-Gm-Message-State: ANoB5pkxV0CDzdZIrlMp1BwFez/9jNWAvuCPDL1xCJ+4v4LRCO2bUXj3
 0+jfrkWQ9ATj4ZdJkxB/dRNSIm+EBapYNGi5
X-Google-Smtp-Source: AA0mqf4YW1nO2F+3FRzUzXiaU9hUHrufYv8S2Hf0atsHZYor45fN1rViQZYu8Y13PHXYY3+U6tq1Uw==
X-Received: by 2002:aa7:c3c2:0:b0:457:791d:8348 with SMTP id
 l2-20020aa7c3c2000000b00457791d8348mr193294edr.306.1668646795746; 
 Wed, 16 Nov 2022 16:59:55 -0800 (PST)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com.
 [209.85.128.54]) by smtp.gmail.com with ESMTPSA id
 o5-20020a056402038500b004619f024864sm8129745edv.81.2022.11.16.16.59.54
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Nov 2022 16:59:55 -0800 (PST)
Received: by mail-wm1-f54.google.com with SMTP id
 h186-20020a1c21c3000000b003cfe48519a6so3314073wmh.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 16 Nov 2022 16:59:54 -0800 (PST)
X-Received: by 2002:a7b:c4d8:0:b0:3cf:b0ed:de9d with SMTP id
 g24-20020a7bc4d8000000b003cfb0edde9dmr3518370wmk.188.1668646794601; Wed, 16
 Nov 2022 16:59:54 -0800 (PST)
MIME-Version: 1.0
References: <20221116162152.193147-1-john.ogness@linutronix.de>
 <20221116162152.193147-15-john.ogness@linutronix.de>
In-Reply-To: <20221116162152.193147-15-john.ogness@linutronix.de>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 16 Nov 2022 16:59:42 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U_sTtbuKeyoE6m4OznnQyPGaMKC6+NMOjH9h8zSD092g@mail.gmail.com>
Message-ID: <CAD=FV=U_sTtbuKeyoE6m4OznnQyPGaMKC6+NMOjH9h8zSD092g@mail.gmail.com>
To: John Ogness <john.ogness@linutronix.de>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On Wed, Nov 16,
 2022 at 8:22 AM John Ogness <john.ogness@linutronix.de>
 wrote: > > Guarantee safe iteration of the console list by using SRCU. >
 > Signed-off-by: John Ogness <john.ogness@linutronix.de [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.41 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.41 listed in wl.mailspike.net]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ovTG6-00AvCj-SC
Subject: Re: [Kgdb-bugreport] [PATCH printk v5 14/40] kdb: use srcu console
 list iterator
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
Cc: Petr Mladek <pmladek@suse.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 kgdb-bugreport@lists.sourceforge.net, Aaron Tomlin <atomlin@redhat.com>,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Thomas Gleixner <tglx@linutronix.de>, Aaron Tomlin <atomlin@atomlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Wed, Nov 16, 2022 at 8:22 AM John Ogness <john.ogness@linutronix.de> wrote:
>
> Guarantee safe iteration of the console list by using SRCU.
>
> Signed-off-by: John Ogness <john.ogness@linutronix.de>
> Reviewed-by: Petr Mladek <pmladek@suse.com>
> Reviewed-by: Aaron Tomlin <atomlin@atomlin.com>
> ---
>  kernel/debug/kdb/kdb_io.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)

Without becoming an expert on this whole series, this seems reasonable to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
