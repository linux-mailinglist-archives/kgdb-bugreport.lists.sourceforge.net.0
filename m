Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E43520F3CB
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 30 Jun 2020 13:49:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jqEl8-0003iZ-9p
	for lists+kgdb-bugreport@lfdr.de; Tue, 30 Jun 2020 11:49:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jqEl6-0003iH-Dg
 for kgdb-bugreport@lists.sourceforge.net; Tue, 30 Jun 2020 11:49:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xYEhR3NPE0R7pZWBg0esf/zJ5br2kx+ti6+DuUnJYI8=; b=j71ok1zr9Ojt040Y2WANUzJFY3
 ykgYrfMlkq9iYcybaLUTGgyXDTlLMA+uuVAwdK7BD1hgl/s8Iz10PEbdG1ml/oatymI7PcJ6rCpIM
 9a62IAPUsex/EXTOMNToHRWnjJShPRxWH3fLUbJCFHuUwoQL8diBdKahz1lPBmNkR6QU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xYEhR3NPE0R7pZWBg0esf/zJ5br2kx+ti6+DuUnJYI8=; b=HCdkGRSdO2hyaWtKoP5tgu1Etw
 qFNAfQ9c5fr9KUepIiNXuacYTSQU5SK+w65KLnffuLnhD4nm6Qiu59fSs4IntttGQJpnldwWgDMVK
 5ScpZhOMpwy6/Lgz2/3cYVJzvC2QjcSy4ubiBOyj7Dvm+fpAlHz0j4tfcDYns4JIHeGk=;
Received: from mga18.intel.com ([134.134.136.126])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jqEl2-002vsI-Pu
 for kgdb-bugreport@lists.sourceforge.net; Tue, 30 Jun 2020 11:49:04 +0000
IronPort-SDR: 7add0LAQ3I6Jv3lSQW5Ja/kDs4ozF9yKpr7rIG1Yz6xXV+8/xmBS3Bxg9EBSbbsDkq6nUBpE43
 papMveGt1zew==
X-IronPort-AV: E=McAfee;i="6000,8403,9666"; a="133661850"
X-IronPort-AV: E=Sophos;i="5.75,297,1589266800"; d="scan'208";a="133661850"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2020 04:48:55 -0700
IronPort-SDR: ihgcD26HSd3er82WHpBPNsTmfMXWuX0VTAgCQbXncFKlSOgMMooZOmtHqZSTtOqA03umGNVwON
 cM8cyw3LULCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,297,1589266800"; d="scan'208";a="386674833"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga001.fm.intel.com with ESMTP; 30 Jun 2020 04:48:52 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jqEkv-00Gpqe-Gf; Tue, 30 Jun 2020 14:48:53 +0300
Date: Tue, 30 Jun 2020 14:48:53 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20200630114853.GS3703480@smile.fi.intel.com>
References: <CAFA6WYNpCG2xPERd=NeKf+EthbX+1R4iieOL52kWnBp8y_+Nbw@mail.gmail.com>
 <20200630082922.28672-1-cengiz@kernel.wtf>
 <CAFA6WYPDTKQ4cm+TMmRt+qDiF+s3gggCsW1gfzCaaOdP9rJgdQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFA6WYPDTKQ4cm+TMmRt+qDiF+s3gggCsW1gfzCaaOdP9rJgdQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: kernel.wtf]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1jqEl2-002vsI-Pu
Subject: Re: [Kgdb-bugreport] [PATCH v3] kdb: remove unnecessary null check
 of dbg_io_ops
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
 kgdb-bugreport@lists.sourceforge.net,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>, Cengiz Can <cengiz@kernel.wtf>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue, Jun 30, 2020 at 05:06:31PM +0530, Sumit Garg wrote:
> On Tue, 30 Jun 2020 at 14:00, Cengiz Can <cengiz@kernel.wtf> wrote:
> >
> > `kdb_msg_write` operates on a global `struct kgdb_io *` called
> > `dbg_io_ops`.
> >
> > It's initialized in `debug_core.c` and checked throughout the debug
> > flow.
> >
> > There's a null check in `kdb_msg_write` which triggers static analyzers
> > and gives the (almost entirely wrong) impression that it can be null.
> >
> > Coverity scanner caught this as CID 1465042.
> >
> > I have removed the unnecessary null check and eliminated false-positive
> > forward null dereference warning.

> > -               while (len--) {
> > -                       dbg_io_ops->write_char(*cp);
> > -                       cp++;
> > -               }
> > +       while (len--) {
> > +               dbg_io_ops->write_char(*cp);
> > +               cp++;
> >         }

Despite being in the original code this can be simple done in two lines:

	while (len--)
		dbg_io_ops->write_char(*cp++);

-- 
With Best Regards,
Andy Shevchenko




_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
