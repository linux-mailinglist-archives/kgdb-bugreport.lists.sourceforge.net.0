Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0816274E927
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 11 Jul 2023 10:31:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qJ8mk-0001JN-0b
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 11 Jul 2023 08:31:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1qJ8mi-0001IU-EN
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 11 Jul 2023 08:31:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bWfhOL0U8rYGCbU7iO2bFZtG2lY8a2YNkFaUZYv9jzg=; b=YcMzh2etP49ZhCoDBLOS0N1D+L
 SrbRgt7lqfdljc1ScqyUhvlnfM5uy1aTFDCleZUF7AHSfZgkKf0Cxxuku7iqU38Yv/ZZcH8CHtAks
 AFYUl0MH5NPAWBkl1yjDWeBx/VB3H4JWz11Mx9+5i9CQk2W+R45FOVOTqXi8OsBKpDCo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bWfhOL0U8rYGCbU7iO2bFZtG2lY8a2YNkFaUZYv9jzg=; b=Hs3JwliCMaZTv3XuUnyMVrZnn/
 PN617RmTBUmuqkhjOTo8aq715Kts9U6nLH1gC8wJ3WqvElGzhtM8U6aK6nzKHMRvZKRpvY6zbP7pi
 sIbssmhbnUHizpEDQ1VL6/0T1hznX6K+Pt6XIfXwEITz97ZFJATKuwB4WpHKJAtuewiM=;
Received: from mail-wm1-f44.google.com ([209.85.128.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qJ8mk-0008Gn-PE for kgdb-bugreport@lists.sourceforge.net;
 Tue, 11 Jul 2023 08:31:49 +0000
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-3fbc5d5746cso61653175e9.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 11 Jul 2023 01:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689064302; x=1691656302;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=bWfhOL0U8rYGCbU7iO2bFZtG2lY8a2YNkFaUZYv9jzg=;
 b=u5I4T/+A7DAgfQOYhM/egSHPRPvGOkzdsc+Ah1uHC/IdozJ9SklS77Ba/T2J/WR/v9
 JDtU2mk3wDlcpDntt2YlT2wmprCoYxTIm3unG2hdD5TSD0R5GQhuWuClXqeNtGXkzuz/
 pGx+T1ZJWRhKYcdt+DsysGRxtA6Cyrgr0/L2xjwQmYjlNjux2Y+P0SqC04fYvnicjt9/
 aekKYnKEYjrLOCJNoIjn1qU56HO4ouQ647Sc42nQA52s3A7ezHB2lTv8RsJ2bi0/kHBJ
 CQYO1dt3A/agRMLyj8cGGkXnCiwhUDMzYqOCQ63eMkjXfW5bI+lGJhdZcZqkAFj/He+1
 mRbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689064302; x=1691656302;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bWfhOL0U8rYGCbU7iO2bFZtG2lY8a2YNkFaUZYv9jzg=;
 b=clnzfaeEj4WBMqRNG0JHSHdnmeqWY2725tN2axCw1ySqH+KM8RDdy4wcGTb7+oiVTf
 S87DwB55rmioIKL500awejohYJhoUfu3kQ/BMsVhk0Aig5wCPYqz8aWl90cmUtZqJelR
 omsI1sCVAiwRf0+5POVq2c5wAEJQDNVeIOpnMPbgq9AlAO8vqXB4dempWd3rlQBd/w5f
 L+RC2AwjgrT+4XYlb+tXdTMb5RhzZxUupi1wLD4xE08ow6cERh2Cz3yE3qiV9q10wEAj
 FYZ9TtzCxUd3DVf6gjLDm4xjeEfmbhtjOanPliQF7shXQE3BAQ6cCuYwVthvZrKgxzsI
 NYfQ==
X-Gm-Message-State: ABy/qLazNBSsQCrrynxbjmpdyB2cIwSABrpiXKE7podHRPPFOtmXABV6
 9/U8MbjnVkv+vPFMBI4urNJF4pzO4iTRbgqzZQ1f+U7c
X-Google-Smtp-Source: APBJJlFW5hJ233s0Ak0LbKmIutem+TONDSgNwOWCndaPsJufSxYq8e30lFidKzGMpIoA3n3urToyNA==
X-Received: by 2002:a5d:4bc6:0:b0:314:71a5:c103 with SMTP id
 l6-20020a5d4bc6000000b0031471a5c103mr12215472wrt.61.1689063821184; 
 Tue, 11 Jul 2023 01:23:41 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 r8-20020a056000014800b0030fa3567541sm1579223wrx.48.2023.07.11.01.23.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 01:23:40 -0700 (PDT)
Date: Tue, 11 Jul 2023 09:23:39 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <20230711082339.GA26224@aspen.lan>
References: <20230710134524.25232-1-john.ogness@linutronix.de>
 <20230710134524.25232-2-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230710134524.25232-2-john.ogness@linutronix.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jul 10, 2023 at 03:51:20PM +0206, John Ogness wrote:
 > It is allowed for consoles to provide no write() callback. For > example
 ttynull does this. > > Check if a write() callback is available [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.44 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.44 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1qJ8mk-0008Gn-PE
Subject: Re: [Kgdb-bugreport] [PATCH printk v2 1/5] kdb: do not assume
 write() callback available
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
Cc: Petr Mladek <pmladek@suse.com>, kgdb-bugreport@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Aaron Tomlin <atomlin@atomlin.com>, Jason Wessel <jason.wessel@windriver.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, Jul 10, 2023 at 03:51:20PM +0206, John Ogness wrote:
> It is allowed for consoles to provide no write() callback. For
> example ttynull does this.
>
> Check if a write() callback is available before using it.
>
> Signed-off-by: John Ogness <john.ogness@linutronix.de>
> Reviewed-by: Petr Mladek <pmladek@suse.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>

For v1 I shared an ack rather than queuing the patch. Although reading
the thread back it is possible that was based on a misunderstanding
(https://lore.kernel.org/lkml/20230309113020.GA78621@aspen.lan/ ).

Anyhow, it looks like you have designed the new series to be picked
individually?


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
