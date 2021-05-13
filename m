Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B51037F9C7
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 13 May 2021 16:36:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lhCSD-0002Ac-9V
	for lists+kgdb-bugreport@lfdr.de; Thu, 13 May 2021 14:36:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <senozhatsky@chromium.org>) id 1lhA6u-0003x1-WF
 for kgdb-bugreport@lists.sourceforge.net; Thu, 13 May 2021 12:06:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LiqqNhlGxeXjrKxJif9khEnQvHkdwIs+05Gzjqmjpcc=; b=nUN3dTLoa6SFvrquhw3KC5hIcu
 MWSnJ5+Z8KkX0MF5DW8tZ1PPiCNCN2cPjLHOGTHqrvgow6XJ/7JWKZUe+TftAWUysDv3FHr63UD/i
 OYKTXjCrxMHJ8LVSZoiN/7th9/iv71ExL1xM/q0/y5gVHqJfDU2Hnf+XzpU/s0N3xmp4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LiqqNhlGxeXjrKxJif9khEnQvHkdwIs+05Gzjqmjpcc=; b=gCga33ecCjvE9GfOJmhR17kbuA
 kKWyAPlvfUfw0yzsnrH2JyiSxKK/1uDb0QGVOh7GOaR5eXrWtRSQ1SgAbhZbRfc5CLKWjgJWy/jPR
 f6isEZBGaHajk6Dl0Xrs/mcqzi/B2TcwS18dHIwCd2f/KME+YCF2BupaK36xQgYb8UNs=;
Received: from mail-pf1-f179.google.com ([209.85.210.179])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1lhA6m-006gwM-Lg
 for kgdb-bugreport@lists.sourceforge.net; Thu, 13 May 2021 12:06:37 +0000
Received: by mail-pf1-f179.google.com with SMTP id c17so21550180pfn.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 13 May 2021 05:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=LiqqNhlGxeXjrKxJif9khEnQvHkdwIs+05Gzjqmjpcc=;
 b=JSy1a6GCJq2YyfpTNSfJS8qqrILCcxtDE5ElH2K2/E24R3FWXdOQ02VULX9h2Pj+I+
 NtrEoxuFD2ShSH71n+IAsSvw74CstZseJ176nvisB5OpUB7L1E7Ary5a0jtBHXhivVKF
 kD+16nkHtwzi2iAoAEmeBpD4ePQ/xbCiBUASU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LiqqNhlGxeXjrKxJif9khEnQvHkdwIs+05Gzjqmjpcc=;
 b=igaxtAviK11zi1T9unlKGdUlhiPtcPK6wxGha7nE8MmIKMdC0d4nluFmgPJqVMWF/A
 Q7pjktSDAnj7J2i/dFahCYXZN//cFMMyWTe5dg3IFOkk2a/dIVfKOf1/Ec6vUOXWqEha
 Z2ythfzVNkA4Z+DeV7Kkg8E5lHZF86PS485IbiHPeHeOmmlSXB3fmokFXp1Z3cMSAe4W
 CwkcLFTIZQUqtJpjK58e/cYb6ng0zkYUSSHd7mb+wwrdq3CnLTVp+fMvq4CLCyhn67N3
 2U7zuKBCb1gbGD6tYr4HO0o9dR419IO2EyYzFT9PLtPQZoT9o5UuaaXglldrzG80Wzsg
 l0Iw==
X-Gm-Message-State: AOAM5337q9JjVAzmzsvSjux8PaIpVAMqnoDk2aVIt+P9rH9Wp1DdE4Sy
 9BwR2XUz2eRQ2EfBcAIo8HPvbw==
X-Google-Smtp-Source: ABdhPJwfllyYOMfe4rEresq4fLk8nKv6sDRzFnk94yymmf2sl08gP8XdMvFcQyRYMXfrGcMKqNEoqQ==
X-Received: by 2002:a17:90a:2d8e:: with SMTP id
 p14mr4752238pjd.121.1620907583031; 
 Thu, 13 May 2021 05:06:23 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:161f:cde2:c883:ef91])
 by smtp.gmail.com with ESMTPSA id f14sm5112636pjj.53.2021.05.13.05.06.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 05:06:22 -0700 (PDT)
Date: Thu, 13 May 2021 21:06:14 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Petr Mladek <pmladek@suse.com>
Message-ID: <YJ0WNuFr7JmSrN62@google.com>
References: <20210511153958.34527-1-andriy.shevchenko@linux.intel.com>
 <YJzymZ7m3R1ELjGD@alley>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YJzymZ7m3R1ELjGD@alley>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.179 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.179 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lhA6m-006gwM-Lg
X-Mailman-Approved-At: Thu, 13 May 2021 14:36:44 +0000
Subject: Re: [Kgdb-bugreport] [PATCH v2 1/4] lib/vsprintf: Allow to override
 ISO 8601 date and time separator
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
Cc: linux-doc@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, linux-nilfs@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Jonathan Hunter <jonathanh@nvidia.com>,
 Mathias Nyman <mathias.nyman@intel.com>, Steven Rostedt <rostedt@goodmis.org>,
 linux-tegra@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, JC Kuo <jckuo@nvidia.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jason Wessel <jason.wessel@windriver.com>, Joe Perches <joe@perches.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On (21/05/13 11:34), Petr Mladek wrote:
> On Tue 2021-05-11 18:39:55, Andy Shevchenko wrote:
> > ISO 8601 defines 'T' as a separator between date and time. Though,
> > some ABIs use time and date with ' ' (space) separator instead.
> > 
> > Add a flavour to the %pt specifier to override default separator.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Reviewed-by: Petr Mladek <pmladek@suse.com>
> 
> I am going to queue the entire patchset for 5.14 via the printk tree
> the following week unless anyone complains in the meantime.

Looks good to me

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
