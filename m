Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C19C737A965
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 11 May 2021 16:33:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=U6EBoW3fbRgQJQKhaCWr7oAulW3PSItTcG6NJO81hEw=; b=iQ5Oide/iwp2HUVjgzdG8Syha
	txO6CuoBBAXIPed/pfiAyPYQ2BZx144wnAAk+CoNnO1uRwLW2/t6z1tWXgMtGRJVkxdPpYKSu3o7X
	CkD+Emq+B6pNZIahSLahZ7G7sbiUKPnRSBJVPwRIOz8prblpZ+4DFBwD5A/Xf+L+aqXK8=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lgTSM-0001Le-Q6
	for lists+kgdb-bugreport@lfdr.de; Tue, 11 May 2021 14:33:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <pmladek@suse.com>) id 1lgTSI-0001L6-VG
 for kgdb-bugreport@lists.sourceforge.net; Tue, 11 May 2021 14:33:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rSjMZQsPrsPF/ua9LWX6ZnQ0hSbJwsZWpSXRVeSGoc4=; b=IvHFO2CUQ2pvuSJOgWgdOzztIM
 fftC60MLEmxh03gwFMfs833xpC/H1ryesFqGu94+23oMLwOykVqmwcps7d0zvBZQVGnfqFnEtAabw
 yP6vAJ8xX7rTquWI2QcvxF7954PVd29T0vw8tD2ZpH5chD+9YCiprCnYhENg01BYAzyU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rSjMZQsPrsPF/ua9LWX6ZnQ0hSbJwsZWpSXRVeSGoc4=; b=R8ellKj/WWqOI/yuEUvyO3cX3P
 nE0N5mZQUp3vnwTDMzwt9FhzkvPP1C+p0mNlVxqIV2VZjKacNWbyYKtdlpwsz+q63KYaDdI9bElql
 epf4bCJVX1TXqY6AQVqPl2T3A+F+/f9k+5Q0pA4AA++RjAVSrbPwvlYPXDFtgOwXEYxo=;
Received: from mx2.suse.de ([195.135.220.15])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lgTSC-0001sN-HH
 for kgdb-bugreport@lists.sourceforge.net; Tue, 11 May 2021 14:33:52 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1620742615; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rSjMZQsPrsPF/ua9LWX6ZnQ0hSbJwsZWpSXRVeSGoc4=;
 b=VNg+YXHAB3GGKG1mZy4l4l4pSKCKxUJ6xN3mOewccCaPWoqKGuEMvltW5WPcOq7RBg/BNl
 7a7OBTuHGRodbx+ktQM9IeDOMVJNrK/AGO5mLH9ZQYv+LD9f0gdKjCoAOWSwiHnlGTNV6Y
 Y6plfj5QLr/rIQf2ZaGJuuHWkx+LQR8=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9296BB03C;
 Tue, 11 May 2021 14:16:55 +0000 (UTC)
Date: Tue, 11 May 2021 16:16:55 +0200
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID: <YJqR11LtIoPiDBSl@alley>
References: <20210510150413.59356-1-andriy.shevchenko@linux.intel.com>
 <20210510150413.59356-4-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210510150413.59356-4-andriy.shevchenko@linux.intel.com>
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
X-Headers-End: 1lgTSC-0001sN-HH
Subject: Re: [Kgdb-bugreport] [PATCH v1 4/4] usb: host: xhci-tegra: Switch
 to use %ptTs
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

On Mon 2021-05-10 18:04:13, Andy Shevchenko wrote:
> Use %ptTs instead of open coded variant to print contents
> of time64_t type in human readable form.
> 
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
