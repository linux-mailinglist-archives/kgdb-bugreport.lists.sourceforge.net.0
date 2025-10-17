Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D593EBE796D
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 17 Oct 2025 11:20:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5U1mUv2MXaBWrfhRw5lPeHtZ2QHaObzxsDTZwOlTWFs=; b=hQiGCzI6niS9yxe5yXjExbL4pR
	6DNXoGidUrLctKE6p3/swT2IcOPyJDodWvFg0pMZnTIgFuzvFDr+qXAMH3xNBmfnOi+gWef/EiNA4
	Tssvv5YHITuUpsGXST4fKiR+lPf3z9s7IhDfHkMQmNdFY6MfdphcHjLFciscgVOhBk+Y=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1v9gd3-0004nI-L8
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 17 Oct 2025 09:20:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1v9gd0-0004n2-N1
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 17 Oct 2025 09:20:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VPMqXFh/dNNEvS2vqa7Ou7b74ZgoKM83pdwBrATLUys=; b=XejFs6dbvT7GwRQltZUO3KXL9/
 jqWf8E6JzpUmGIDIhE36wR2ac0fCHzzFnH1Wznf3lsSwtyiwAm5YFabiWXl/t65JXmhbDjK3rCoMF
 LoqyyZOL6Fk9DGJzAkImZwV/tQfOHZE3ypgRCCev4pDC5kktjgs2X1rbjWxvilAKBLMg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VPMqXFh/dNNEvS2vqa7Ou7b74ZgoKM83pdwBrATLUys=; b=CQ8e6cevhIRAu6h741+eoX5fSz
 JpwM+9tDPqXIzQYcdAHgryNTTWbeo2iIrMCEgRjh+7lapUU1V2KDPtIzaf/2ufFWdDt2vetlFVQAl
 FxSJTSmJHSq/gQUNB9IlS1Sdfbtm6/wUaBoruyWxvvKOzar3g8jfZkz4aHHkR9u2Nl1k=;
Received: from mail-wr1-f45.google.com ([209.85.221.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1v9gd0-0002CS-2f for kgdb-bugreport@lists.sourceforge.net;
 Fri, 17 Oct 2025 09:20:02 +0000
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-4256866958bso1066134f8f.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 17 Oct 2025 02:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1760692795; x=1761297595; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VPMqXFh/dNNEvS2vqa7Ou7b74ZgoKM83pdwBrATLUys=;
 b=FMJh4y4mtmuOneex85xYtaW8r94wFRlglTfHCN5w9iePnUzjyMwiehN7vSQJkMWceF
 CJE/k7Hr4kmOPuB0FCWBl1p+qRc751sef8KTiBWG2pnUzQNmca46VFR8BZwl12Ifjmr6
 YPEVp885hTB+mNYT44H/U+Jm+l/ITnOY3yDmeKtvZBwsq52MBJhxnU/GDtqHHViFZVyd
 X5wi59Xlh5iminvzC+bE/WXTiP4rvZ8PB1VPNF/1yDdCZMCj93mP5iSnnjROaG/RQZQw
 w4wED3+1r6t1OS54Y4dAxkjgqlqYVN/iOZXnCiWgVSOHBPBKFX5tQyVLTFX09sJLTCdB
 kAFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760692795; x=1761297595;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VPMqXFh/dNNEvS2vqa7Ou7b74ZgoKM83pdwBrATLUys=;
 b=Q1onuq3yvkPfKP4pg9vo0K0XrcwwutP/WLxP6SDx4ojwkoGdR319dWaiAqlou4zPX2
 NCbf2LSUg25tfp7NQXmdulKXiNxJX3LJ1CvU3NDumkh6lD9uYJPRGcL2srlNZTxHpoz+
 IRn4lRlKiTn+gbairYlp37wJnoi9eupgy+o+u7cqaZdlFjvMKDf5eof12J/tCTaovPtF
 MSAYgZtsSaYrU/QsjbS4muJOk3D7qtWeevaXeaKWZsg0+NACcryxNMUOyDAacJdsvn/W
 M8QiA6zY8gBhjZwI3g291iV7FYxyQkKNIthGXPqsRHEsiOxcnv64SK9P5pCqV3YJTwFM
 LPtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVn15KWSjPK/Top0PXaFqVPU0yt/eGGKWhREf8k9eMYFMmEZRC1yFxubwxKiha5K0QhCct+4euB9mhqP3et2w==@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yxvck8snxbXMFIymZfrCnFi2eZ/9DJfoP95aKk5SoilzQ+oltPr
 juN3usoAJ+2mRx19EkTHGqyR1CdwRik4eUqdpTUp8d5AX17ROqjLuoGYGq/1OMb1Qdh4V9JhmMo
 uwWqq
X-Gm-Gg: ASbGncvo1/tOE6qehr49VlWbHELoXOkdyMP2MbSEkkU2IKwqpdhYe4hy5wKQC/xEt85
 AmVYLrXAwtcchk6yNBaBrOf8ZEywYPd5JHmmE50gdfNcc8EETdo48SelJjCGMQXvS+E3dpbu1an
 nWnnP36Azi9rNdmqUI1YHZycS7kfoS1+pgp9Kgyg+K2KzORqyJln7Z915tCPHrfRnlMV3ifN2MI
 8IXUK46dbpNcpOenJ4ozqXmbikD6kbOJL0fdiiC7Qi/2WntLmuA3FZ32c9jAStYPzeG/CK1EtDb
 wnfHpePdeL3c159AVo2S0hw705WKyY2Slie+RV5gRu/Kwmxdv0J/fbzK8OhZRfbmbdSQuXARJAx
 E8HeCVYZf4a9tDC46gmAyQJq1Q/JnIWQUDQ0W4k17PRW2I/mCvnb74B6xCuJj1/ueL2qfbnAY73
 8YwDOXK4OYQgHl9g==
X-Google-Smtp-Source: AGHT+IHdkNU1vaYBqPsplsa4EJzoy/8Ut9krm5VAfFBmljD+VWsSOkiW4JEtZfw1U4XSgBeWnDsD2Q==
X-Received: by 2002:a05:6000:258a:b0:3e9:9f7f:6c36 with SMTP id
 ffacd0b85a97d-42704ddc6a4mr2107502f8f.54.1760692795387; 
 Fri, 17 Oct 2025 02:19:55 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-471144b5c29sm73120275e9.12.2025.10.17.02.19.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 02:19:54 -0700 (PDT)
Date: Fri, 17 Oct 2025 11:19:52 +0200
To: kernel test robot <lkp@intel.com>
Message-ID: <aPIKOOBfOH1cg01F@pathway.suse.cz>
References: <20251016-nbcon-kgdboc-v6-3-866aac60a80e@suse.com>
 <202510170949.NTx9lt0p-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202510170949.NTx9lt0p-lkp@intel.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri 2025-10-17 09:25:53, kernel test robot wrote: > Hi
 Marcos, > > kernel test robot noticed the following build errors: > > [auto
 build test ERROR on 3a8660878839faadb4f1a6dd72c3179c1df56787] > > [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [209.85.221.45 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.45 listed in wl.mailspike.net]
X-Headers-End: 1v9gd0-0002CS-2f
Subject: Re: [Kgdb-bugreport] [PATCH v6 3/5] printk: nbcon: Allow KDB to
 acquire the NBCON context
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
Cc: John Ogness <john.ogness@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Marcos Paulo de Souza <mpdesouza@suse.com>, oe-kbuild-all@lists.linux.dev,
 Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Daniel Thompson <danielt@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri 2025-10-17 09:25:53, kernel test robot wrote:
> Hi Marcos,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on 3a8660878839faadb4f1a6dd72c3179c1df56787]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Marcos-Paulo-de-Souza/printk-nbcon-Export-console_is_usable/20251016-225503
> base:   3a8660878839faadb4f1a6dd72c3179c1df56787
> patch link:    https://lore.kernel.org/r/20251016-nbcon-kgdboc-v6-3-866aac60a80e%40suse.com
> patch subject: [PATCH v6 3/5] printk: nbcon: Allow KDB to acquire the NBCON context
> config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20251017/202510170949.NTx9lt0p-lkp@intel.com/config)
> compiler: or1k-linux-gcc (GCC) 15.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251017/202510170949.NTx9lt0p-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202510170949.NTx9lt0p-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from kernel/kallsyms.c:19:
>    include/linux/kdb.h: In function 'kdb_printf_on_this_cpu':
> >> include/linux/kdb.h:229:63: error: expected ';' before '}' token
>      229 | static inline bool kdb_printf_on_this_cpu(void) { return false };

Great catch! This should be:

	static inline bool kdb_printf_on_this_cpu(void) { return false; }

No need for v7. I could fix it when commtting the change.

BTW: It is interesting that the robot was so quick this time but
     it did not catch it in the earlier versions of the patchset.
     Maybe the robot had a summer vacation as well ;-)

     I am just joking. I know that any resources are limited and
     could not test everything. It is great to have the robot around.

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
