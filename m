Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1532537F4E1
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 13 May 2021 11:34:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=r0egdHJHG/Ym0ubX0yjPKlzn+kDbnTDf1DKurGn/+MU=; b=dNz345lzkoqz4oUrEtR5AStS6
	24Lu18pFNETg+cWL+Q5g3cDHLYrNxZeiRAYrNpvir5oKm/VTMMHkW1CF2q1lJeYRTAxWoKjPb2oGa
	mM5dy93HXnYgGodLM9ojRQfkf0HI83UEybg6tdMpkIM4Af712x61yaPMbhxMoUs0rkYPc=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lh7jo-0004vb-5p
	for lists+kgdb-bugreport@lfdr.de; Thu, 13 May 2021 09:34:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <pmladek@suse.com>) id 1lh7jn-0004vV-HJ
 for kgdb-bugreport@lists.sourceforge.net; Thu, 13 May 2021 09:34:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bOeXjgffhRk4ROYar2MNv8Jtg7kJ41kJ+qOqxZ43DeA=; b=C1E251nOOKeLEDtNtSuCBOKXn7
 xWVWlO1JjIxmwnocd9IiO9N/e6tyXztp1oRkM2bHpDZzilGN9jhxdddX6S5a/ynWuYnpULucw27Lf
 0X0Koakgl6yHzmf0hfqVV55/gJ99I9v8fOM1BRTR0SZmzx8Kw6xuEQ6UFmGdfqdxk0eE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bOeXjgffhRk4ROYar2MNv8Jtg7kJ41kJ+qOqxZ43DeA=; b=NsdSsYmy1LSDOLCENPrmv1mIwC
 XVkZRylBYMm1MgXxcXQYKGKYc6g7UuuhLrk9UZPEWx0SmYSGyyUh7RfvwuBOJTKX7K5ARvcBIvM7M
 42GKWhMVVfF85xSmdJ8GQxNb4BVHbOYsqlqCuGXOUWrYAsVyHL5d09WfhM3z8IubEQzM=;
Received: from mx2.suse.de ([195.135.220.15])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1lh7jh-006YF2-Ml
 for kgdb-bugreport@lists.sourceforge.net; Thu, 13 May 2021 09:34:36 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1620898459; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bOeXjgffhRk4ROYar2MNv8Jtg7kJ41kJ+qOqxZ43DeA=;
 b=JldI/5nRDymnQ0GD1tOj3C0xjFauFlRVsMq7TmtJAemWoVVsiaetI55P07F0ZtkXSTwqLp
 bYhVznRykaMlcfnF0XK5Dn/J/UlFgc2DRdxfnLReWlZIkgq7pVSzVhgV+TiQTkzz6j6td4
 SvRnqkcCxcQxm6oV+cuTFNRJC42t+YQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BD533AED6;
 Thu, 13 May 2021 09:34:18 +0000 (UTC)
Date: Thu, 13 May 2021 11:34:17 +0200
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID: <YJzymZ7m3R1ELjGD@alley>
References: <20210511153958.34527-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210511153958.34527-1-andriy.shevchenko@linux.intel.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: intel.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.135.220.15 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lh7jh-006YF2-Ml
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
From: Petr Mladek via Kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>
Reply-To: Petr Mladek <pmladek@suse.com>
Cc: Daniel Thompson <daniel.thompson@linaro.org>, linux-nilfs@vger.kernel.org,
 Mathias Nyman <mathias.nyman@intel.com>, linux-doc@vger.kernel.org,
 JC Kuo <jckuo@nvidia.com>, kgdb-bugreport@lists.sourceforge.net,
 linux-usb@vger.kernel.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Jason Wessel <jason.wessel@windriver.com>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joe Perches <joe@perches.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue 2021-05-11 18:39:55, Andy Shevchenko wrote:
> ISO 8601 defines 'T' as a separator between date and time. Though,
> some ABIs use time and date with ' ' (space) separator instead.
> 
> Add a flavour to the %pt specifier to override default separator.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Petr Mladek <pmladek@suse.com>

I am going to queue the entire patchset for 5.14 via the printk tree
the following week unless anyone complains in the meantime.

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
