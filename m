Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D481E9CD2
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  1 Jun 2020 06:54:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jfcT5-000520-Qx
	for lists+kgdb-bugreport@lfdr.de; Mon, 01 Jun 2020 04:54:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jfcT3-00051t-MI
 for kgdb-bugreport@lists.sourceforge.net; Mon, 01 Jun 2020 04:54:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PFSYaUeH6bbEPrcWmIISYpjM8SJ6UtUjsuzuTLo613A=; b=XiBgN4MMNVIwpyQEUFx2RQhh27
 K6einI+y/kxSzT4Xv1u0jx7kRHC6Df0BPd4xyJWhX5NZe9TgYNgrnna+S2u3bl6XZbhIygx71F7rD
 dDfmQiiJGKY4l3eS1AtaSZv1YYqRDmo6ZXLCbSkNVKqgfiFE34y/+OmXzurnEqV2fPDE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PFSYaUeH6bbEPrcWmIISYpjM8SJ6UtUjsuzuTLo613A=; b=PxP6vkzI4RSESpFdXJbFbEGYiS
 exHvM/qJoylpHCMMHT+mfRqOrY02rbqjWDMcv1ekCprVr3FDpk0AKuU+AkPYY4wmTsK8QZjx+CRCw
 3w9hlQBkE+YIw821+uEWZY0t0U7m3aItNcuDWd2tODG2QvfThVH8nxRPK7aS9g+TSgzo=;
Received: from mail-lj1-f193.google.com ([209.85.208.193])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jfcSy-005ufb-7o
 for kgdb-bugreport@lists.sourceforge.net; Mon, 01 Jun 2020 04:54:33 +0000
Received: by mail-lj1-f193.google.com with SMTP id e4so6496434ljn.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sun, 31 May 2020 21:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PFSYaUeH6bbEPrcWmIISYpjM8SJ6UtUjsuzuTLo613A=;
 b=OChVtVFMRePEkw6sCWnVXVnlXqexPXQF81+dbi/hEvAO2/FdcRtzm96MtavQREIkxi
 8ZVt4/5K5kWZBSSKL4rsy0V/sCLKvesv9HdctX7JvjqRqVNh4axTebCMUji5+teXj36B
 NMCuiXCF+1HjX74Jm67vXvK80iysmdxCBa26b5a6x8cLwz9h9/TXkPenJrhEof4Tvf1K
 vqeBXcM203sRAw/NyE6uQAf/J0aqx7HzfnHNZ5KUz9pQ919dIRNsGIRozP5K+YqSj45x
 IyDj49fvKuLwJv34HFoz+EWwSrEvn12AQK1ykomrjF7wWDLFP7OHOVvMTEWjnvdxcnqM
 7eTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PFSYaUeH6bbEPrcWmIISYpjM8SJ6UtUjsuzuTLo613A=;
 b=Jn3xA56oKMP2BMxxo3Nwkxix1Sx7p9w/NCCOWqGHaYvn7f15u/eXs3+xPdsgG8lnqK
 ZiIfNABYREeREzSX+JN/TQloaMIUwhSf04wyKGgHaxiHe7KigDxLThOC/fsRsyfhCL7Y
 Am9ayA5v9j+2Nu8y/JrjJzi/zh35k3nFi8zUSoldUaZYrNHWl2WsarIE+eA7xUPcmmSt
 iAJIt7p51fwXju8DAxbwOB+p3vPEry25pdEkWcjXsSOEVv5j4Fa6JoQxw8ZjEkIY7YdY
 8CQt+cLaPNYndjNPniMM3q1dxjVPzKWAGOlSm1SQA/bQcDk/uE0dUCXaWrOqkur2qqeL
 bMLQ==
X-Gm-Message-State: AOAM532H3tIvRF0Lqz6ANaVr7hbRi1LMaDpIthJqPeuxnVvOfZeOoteK
 195+zewmYh3X2RpFgGLXHH21cWj1mD1Lr4Q0n1cKXw==
X-Google-Smtp-Source: ABdhPJzjx4JrFGwf17KmTYfrs8QukHRA4wXCg660QnTwSRtyKKP8Wx7WX0nvnjxDMgdZH0L75v/i3CHka9+afTO///g=
X-Received: by 2002:a05:651c:1103:: with SMTP id
 d3mr24209ljo.110.1590987254498; 
 Sun, 31 May 2020 21:54:14 -0700 (PDT)
MIME-Version: 1.0
References: <1590751607-29676-5-git-send-email-sumit.garg@linaro.org>
 <202005311324.We2amqkp%lkp@intel.com>
In-Reply-To: <202005311324.We2amqkp%lkp@intel.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 1 Jun 2020 10:24:01 +0530
Message-ID: <CAFA6WYOLApZTXkE0KyN80Fr=9cnBHqzbA9suQvzG4D8ZzOnBeA@mail.gmail.com>
To: kbuild test robot <lkp@intel.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: intel.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.193 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.193 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jfcSy-005ufb-7o
Subject: Re: [Kgdb-bugreport] [PATCH v4 4/4] kdb: Switch to use safer
 dbg_io_ops over console APIs
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
 Daniel Thompson <daniel.thompson@linaro.org>, kbuild-all@lists.01.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 kgdb-bugreport@lists.sourceforge.net, jslaby@suse.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 clang-built-linux@googlegroups.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Sun, 31 May 2020 at 10:58, kbuild test robot <lkp@intel.com> wrote:
>
> Hi Sumit,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on tty/tty-testing]
> [also build test ERROR on usb/usb-testing v5.7-rc7 next-20200529]
> [cannot apply to kgdb/kgdb-next]
> [if your patch is applied to the wrong git tree, please drop us a note to help
> improve the system. BTW, we also suggest to use '--base' option to specify the
> base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
>
> url:    https://github.com/0day-ci/linux/commits/Sumit-Garg/kdb-Improve-console-handling/20200531-075431
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
> config: x86_64-allyesconfig (attached as .config)
> compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project 2388a096e7865c043e83ece4e26654bd3d1a20d5)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install x86_64 cross compiling tool for clang build
>         # apt-get install binutils-x86-64-linux-gnu
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=x86_64
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
> >> drivers/usb/early/ehci-dbgp.c:1062:24: error: assigning to 'struct console *' from incompatible type 'struct console'; take the address with &
> kgdbdbgp_io_ops.cons = early_dbgp_console;
> ^ ~~~~~~~~~~~~~~~~~~
> &
> 1 error generated.
>

Ah, my bad. Will fix it up in the next version.

-Sumit

> vim +1062 drivers/usb/early/ehci-dbgp.c
>
>   1046
>   1047  static int __init kgdbdbgp_parse_config(char *str)
>   1048  {
>   1049          char *ptr;
>   1050
>   1051          if (!ehci_debug) {
>   1052                  if (early_dbgp_init(str))
>   1053                          return -1;
>   1054          }
>   1055          ptr = strchr(str, ',');
>   1056          if (ptr) {
>   1057                  ptr++;
>   1058                  kgdbdbgp_wait_time = simple_strtoul(ptr, &ptr, 10);
>   1059          }
>   1060          kgdb_register_io_module(&kgdbdbgp_io_ops);
>   1061          if (early_dbgp_console.index != -1)
> > 1062                  kgdbdbgp_io_ops.cons = early_dbgp_console;
>   1063
>   1064          return 0;
>   1065  }
>   1066  early_param("kgdbdbgp", kgdbdbgp_parse_config);
>   1067
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
