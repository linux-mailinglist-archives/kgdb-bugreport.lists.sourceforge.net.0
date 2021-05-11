Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E33C37A964
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 11 May 2021 16:33:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dfwxTFjUOVi99l4inWGILGQHPNN4lUB61+IMe6lmCWQ=; b=jyhrFdKI3kShqb54ajxurdkrd
	6DfuNBW1BGzAv9VQUMGvRB31MkNVqtzNXQydO3S5d9GmlX4A73MC2z0a09dYua++qwQZsYIkdfp2D
	727ObDynJ6UtzgsKyrGb09/hLMZ6JYdDMxLsR7+l6/ua12Sd3ju5kkNE7GPeVTXtMBqW0=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lgTSM-0001LQ-2w
	for lists+kgdb-bugreport@lfdr.de; Tue, 11 May 2021 14:33:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <pmladek@suse.com>) id 1lgTSI-0001L5-Uq
 for kgdb-bugreport@lists.sourceforge.net; Tue, 11 May 2021 14:33:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1ove9wdw6r4iRHmo5g2yf2LcNNnIGLL9LU3ZkdcjuVc=; b=MqrFX+4TsICJcDCcHnnLWaVicB
 Xb2Ayacf5btdM3AmSPfBrX8j1eCwXt88w/HBQXiSybUeHP9LBKQx/t/IfUypPVRF++YDmUYkZCbrr
 xmSZ1IMVB4RLucAvwkRNdUiasJNGOM/AAC8IFfr0VZca7e+bExpb4bZ0NpluYSfM2QOI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1ove9wdw6r4iRHmo5g2yf2LcNNnIGLL9LU3ZkdcjuVc=; b=Vk9e5qSxXa/hBaxnNgwUOxk3zd
 pz3D5aQTZfCyy6kmusn+OG9bNWSTCcT+pb/EpcJkBKi63spET4KndvPJnimvDFdw+qXk8ibdD9yti
 0Nnz6J465QLpYfAkjt26Tl7kd4svWw/oQ6Ctfh/pynLbMGAIjwLb92q7vPbA0LJqZFEY=;
Received: from mx2.suse.de ([195.135.220.15])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lgTSD-003u9j-7y
 for kgdb-bugreport@lists.sourceforge.net; Tue, 11 May 2021 14:33:52 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1620742566; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1ove9wdw6r4iRHmo5g2yf2LcNNnIGLL9LU3ZkdcjuVc=;
 b=aHvLzZWIvsJk1KMLjdyNkEl8fXIYI5sftWVx1O7AA6S/iM87WBaV6ilz6N02Tp7slpyKxk
 aWeZ9QgSIV0pOH2fYyPdmmgugb4RmMECxMagF9xTGA/EcSXVvRv3T5A6govBKbm5qdo7eB
 XvolUoxUH7M50DZ6xJdMrgZtnvdpjHQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 41DEEAF80;
 Tue, 11 May 2021 14:16:06 +0000 (UTC)
Date: Tue, 11 May 2021 16:16:05 +0200
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID: <YJqRpe4wiAflzkus@alley>
References: <20210510150413.59356-1-andriy.shevchenko@linux.intel.com>
 <20210510150413.59356-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210510150413.59356-2-andriy.shevchenko@linux.intel.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
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
X-Headers-End: 1lgTSD-003u9j-7y
Subject: Re: [Kgdb-bugreport] [PATCH v1 2/4] kdb: Switch to use %ptTs
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

On Mon 2021-05-10 18:04:11, Andy Shevchenko wrote:
> Use %ptTs instead of open-coded variant to print contents
> of time64_t type in human readable form.
> 
> Cc: Jason Wessel <jason.wessel@windriver.com>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: kgdb-bugreport@lists.sourceforge.net
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
