Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B03F7C8F395
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 27 Nov 2025 16:18:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x7cBJiMKCgsidmYNNozG4PUmfaLEXYJNL28zi3blw2E=; b=XcPAKMlR2G0L6WsfBoafVgXF90
	XV1S6be1Qqo4AvVf7j2hs6UmIYDK8/oRU4/ELP8n8cCy+xMqwfOJ/CeI7x20yrZ0DF2Jpq393FPuH
	0xY1Q2DRKB2whnPIY4zQwRZAm+YnczlXyeHxD27mVDiPzEYXzCTlRt7wSmdZ9RQn8rkA=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1vOdlp-0007Zc-Eb
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 27 Nov 2025 15:18:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1vOdlo-0007ZR-0V
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 27 Nov 2025 15:18:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=B8l5BzR1mRAYzIMvpm2Ko/o8KqU+gsOnJSeaJXaAzPk=; b=dOoQfC1cY1c5hVdQjByvSnvkt3
 o4X9Nxd2ASN1o7vt1N3sWmHd93AaAHLy8zDplvDRwz57OgKVOBcn7DPGoaQz8DXEV81ts5GBEZSq3
 lK8gslarZM80GQDxVQEQ1iqwIz0xOUy7bHigtEnPtunvwzqvX+sIn4sTYh2asMy2ID5A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=B8l5BzR1mRAYzIMvpm2Ko/o8KqU+gsOnJSeaJXaAzPk=; b=dA5EXfU46cdnL++MpQdRCfkEkP
 IpPrA2e4xGRlpujYEE4tOTB66DAVyypd+yrZLRy3iSQ2XI/sFCfLioEp+BHRB9/Yx5KPN/Cy42iME
 FP7OcVXBcqukvH284wYLgbN/1NDRAmr6vLWRJ5NymBZ6F6ZQRf2Hg8Zk6Wrv6CcUtDX8=;
Received: from mail-wm1-f53.google.com ([209.85.128.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vOdln-0002S7-GM for kgdb-bugreport@lists.sourceforge.net;
 Thu, 27 Nov 2025 15:18:55 +0000
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4775e891b5eso3990305e9.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 27 Nov 2025 07:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1764256724; x=1764861524; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=B8l5BzR1mRAYzIMvpm2Ko/o8KqU+gsOnJSeaJXaAzPk=;
 b=EqhEdk7JlcAGmTppIKNIPbOXKixlR4LWbcYqtCNMv7kHvT5NHTf+/qhKrqWR3lTVQY
 9Z3qx/n506ldnjBbshU+fHuVfQddz8se3q7kNpZnNiNYpX2zzg1+T99YxAQYf88g64cN
 WVDLYQgAFzjm7wO3wyteFORNYmQhCLTFDwJdiFgRBIDy/T+GDw/dUQgi4XsxK2g8HzN0
 H5z2qqsDJE3+tDjGUoowVxLZEyY3qQ0MKDk8RTFMdPeucSn64x3tzwhraY7Ewv8+2RdF
 uR65+1Fy5dL9mR0cNkGWNOHdEppEZHDjlJw1XhYaOOv+OVqw5uJS04JZRSnNlBq3cXiF
 DNnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764256724; x=1764861524;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B8l5BzR1mRAYzIMvpm2Ko/o8KqU+gsOnJSeaJXaAzPk=;
 b=WtLSu8RcyjyU66RebdbdgR/hi837aFpNh/sBN67SjVn6QS91PSSvFb3ACVR8AgQMAQ
 v03qRZJiFuEKJjCpwCx/cLHlD0710KIwZm1S3sCuGg7xDf/cMae1+Z/tbMN/mttbxqrW
 WosQ8ac7kk9ha7cju/yDXUcMIh+jbl5thIUK9b2yqb3b67KkGibfJgMAdhnrkj4ZngK/
 89+H/UK6aYN+p0fwxkbMz+jNQ7YMRsTcuMnQGIZZtWmzbft/8xIGqU2VwM6HrqSZnnWt
 ta+HeqztGMlz7z+5qVhDCK2Hf9hLHCxupCvKvm+xuKqkj59K/mQqWQ5MkgpeKcevtK3W
 iChA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwbfUo//u1SmOBRC46cIyrg4NyI5rulUTXpoVJhlhbmNS9ype/Ndhqul7O/sUotvl9H7SA2ZVubfxaNUIF7w==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyOCsDcM9ECtryxCukJn+25LAkUKUmi0Edy7Y9SBNQB2t61WGde
 8DFC37CsvuZYREp1wftZgxo0SQ04ShD+0RL/i79RuQkOutkqPNGfLSpARGMXSsFXEvI=
X-Gm-Gg: ASbGnctfDdWatEWNWg+gzAuQw6MwdKB51FPeu8RZzx5oBUgFatXYMmJNCW8wObC/748
 HsWXUHM6S8tgLdi4xFaqlzsRxxCWK59UfY5ZzhX7myP30BVyv4Jb7B2fCS73OPMp9Gn5d8WueQK
 YpPCC7n6KHwFENi3DxZrZHs91KPc97PfYcD3pAtbofP6Xvm9h9XPZZDtY0woyclcz/RD3KEovN2
 upWHpG7VvPYrXo/AJapmCvUN/3h2d5vJZ7lQg++gH0I6vqh5EhRV14bZKt07btWQ60kF1oOskwb
 DM6DMw1nIL26oTNWkNdl6jQ2lvv/QXpcRgkC1nZ1svOipaUOE9b3JbXpwloE7oZ5/NbLwKLiF7e
 QftYlXZ03nqctLuK1kcOTvnb6FsHQKLva8+n8xGvz2i4dDcHfyTZg3s30RAP+NPU1sUXqt5s9zo
 yYDw3eVzQQ/DdjqwK8Hxnt8F5t
X-Google-Smtp-Source: AGHT+IE1ABJky03kTdd0RIp7HhLXOcrkFMBT0s/CBFZhAw1YYwvym+Cxf0cLbK7YSjhHltd5yp0qEw==
X-Received: by 2002:a05:600c:1f94:b0:477:7725:c16a with SMTP id
 5b1f17b1804b1-477c0170de8mr221559015e9.10.1764256723867; 
 Thu, 27 Nov 2025 07:18:43 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47911143a16sm36586915e9.1.2025.11.27.07.18.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Nov 2025 07:18:43 -0800 (PST)
Date: Thu, 27 Nov 2025 16:18:40 +0100
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aShr0DZRmpDnL0nz@pathway.suse.cz>
References: <20251121-printk-cleanup-part2-v2-0-57b8b78647f4@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251121-printk-cleanup-part2-v2-0-57b8b78647f4@suse.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri 2025-11-21 15:50:32, Marcos Paulo de Souza wrote: >
 The first part can be found here[1]. The proposed changes do not > change
 the functionality of printk, but were suggestions made by > Petr Ml [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.53 listed in wl.mailspike.net]
X-Headers-End: 1vOdln-0002S7-GM
Subject: Re: [Kgdb-bugreport] [PATCH v2 0/4] printk cleanup - part 2
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
From: Petr Mladek via Kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>
Reply-To: Petr Mladek <pmladek@suse.com>
Cc: Richard Weinberger <richard@nod.at>,
 John Ogness <john.ogness@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Daniel Thompson <danielt@kernel.org>, linux-serial@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net,
 Johannes Berg <johannes@sipsolutions.net>, Jiri Slaby <jirislaby@kernel.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri 2025-11-21 15:50:32, Marcos Paulo de Souza wrote:
> The first part can be found here[1]. The proposed changes do not
> change the functionality of printk, but were suggestions made by
> Petr Mladek. I already have more patches for a part 3 ,but I would like
> to see these ones merged first.
> 
> I did the testing with VMs, checking suspend and resume cycles, and it worked
> as expected.
> 
> Thanks for reviewing!

> Marcos Paulo de Souza (4):
>       drivers: serial: kgdboc: Drop checks for CON_ENABLED and CON_BOOT
>       arch: um: kmsg_dump: Use console_is_usable
>       printk: Use console_is_usable on console_unblank

These three patches were simple, straightforward, and ready for linux
next.

I have comitted them into printk/linux.git, branch rework/nbcon-in-kdb.
I am going to push them for 6.19.

>       printk: Make console_{suspend,resume} handle CON_SUSPENDED

This patch still need some love and v3.

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
